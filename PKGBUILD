# Maintainer: Jakub Luzny (jakub@luzny.cz)
pkgname=nrf5x-command-line-tools
pkgver=9.3.1
pkgrel=2
pkgdesc="Tools for programming Nordic nRF51 MCU using J-Link"
arch=('i686' 'x86_64')
url="http://www.nordicsemi.com"
license=('unknown')
depends=('jlink-software-and-documentation')
provides=('nrfjprog')
conflicts=('nrfjprog')
options=()
source_i686=("nRF5x-Command-Line-Tools_${pkgver//./_}_Linux-i386.tar::https://www.nordicsemi.com/eng/nordic/download_resource/52615/15/17920505")
source_x86_64=("nRF5x-Command-Line-Tools_${pkgver//./_}_Linux-x86-64.tar::https://www.nordicsemi.com/eng/nordic/download_resource/51386/20/55621785")

md5sums_i686=('fbde9d4b9f5446763868bff5fad67740')
md5sums_x86_64=('468d711285c9f802f7e7d1c8e4978cc7')

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
