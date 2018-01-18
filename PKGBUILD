# Maintainer: Jakub Luzny (jakub@luzny.cz)
pkgname=nrf5x-command-line-tools
pkgver=9.7.2
pkgrel=0
pkgdesc="Tools for programming Nordic nRF51 MCU using J-Link"
arch=('i686' 'x86_64')
url="https://www.nordicsemi.com/eng/Products/Bluetooth-low-energy/nRF51822"
license=('unknown')
depends=('jlink-software-and-documentation')
provides=('nrfjprog')
conflicts=('nrfjprog')
options=()
source_i686=("nRF5x-Command-Line-Tools_${pkgver//./_}_Linux-i386.tar::https://www.nordicsemi.com/eng/nordic/download_resource/52615/22/65106172/97746")
source_x86_64=("nRF5x-Command-Line-Tools_${pkgver//./_}_Linux-x86-64.tar::https://www.nordicsemi.com/eng/nordic/download_resource/51386/27/49970842/94917")

md5sums_i686=('e75594c79dbee57527fc7975bd208134')
md5sums_x86_64=('fd5e456a18105244f3df46a900f7d5d9')

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
