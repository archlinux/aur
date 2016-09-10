# Maintainer: Jakub Luzny (jakub@luzny.cz)
pkgname=nrf5x-command-line-tools
pkgver=9.0.0
pkgrel=1
pkgdesc="Tools for programming Nordic nRF51 MCU using J-Link"
arch=('i686' 'x86_64')
url="http://www.nordicsemi.com"
license=('unknown')
depends=('jlink-software-and-documentation')
provides=('nrfjprog')
conflicts=('nrfjprog')
options=()
source_i686=("nRF5x-Command-Line-Tools_${pkgver//./_}_Linux-i386.tar::https://www.nordicsemi.com/eng/nordic/download_resource/52615/10/99891398")
source_x86_64=("nRF5x-Command-Line-Tools_${pkgver//./_}_Linux-x86-64.tar::https://www.nordicsemi.com/eng/nordic/download_resource/51386/15/97799598")

md5sums_i686=('bc1d9ade7720e8a8cb7769859c09a2fd')
md5sums_x86_64=('d9d719e3428e2aba5efc4b95085fec9f')

package() {
    # Install nrfjprog and mergehex
    install -dm755 "${pkgdir}/opt/nrfjprog" "${pkgdir}/opt/mergehex" "$pkgdir/usr/bin"

    cd ${srcdir}/nrfjprog
    cp --preserve=mode * "${pkgdir}/opt/nrfjprog"

    cd ${srcdir}/mergehex
    cp --preserve=mode * "${pkgdir}/opt/mergehex"

	ln -s "/opt/nrfjprog/nrfjprog" "${pkgdir}/usr/bin"
	ln -s "/opt/mergehex/mergehex" "${pkgdir}/usr/bin"
}
