# Maintainer: Jakub Luzny (jakub@luzny.cz)
pkgname=nrf5x-command-line-tools
pkgver=9.2.1
pkgrel=1
pkgdesc="Tools for programming Nordic nRF51 MCU using J-Link"
arch=('i686' 'x86_64')
url="http://www.nordicsemi.com"
license=('unknown')
depends=('jlink-software-and-documentation')
provides=('nrfjprog')
conflicts=('nrfjprog')
options=()
source_i686=("nRF5x-Command-Line-Tools_${pkgver//./_}_Linux-i386.tar::https://www.nordicsemi.com/eng/nordic/download_resource/58857/14/59650487")
source_x86_64=("nRF5x-Command-Line-Tools_${pkgver//./_}_Linux-x86-64.tar::https://www.nordicsemi.com/eng/nordic/download_resource/58852/19/14894180")

md5sums_i686=('0445f8209fa86b05f8cb04a91e03cc3e')
md5sums_x86_64=('4c714ddeb0f39742724e837368d6bbd4')

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
