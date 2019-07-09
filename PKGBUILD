# Maintainer: Alexis Polti (alexis@free.fr)
pkgname=nrf5x-command-line-tools
pkgver=10.2.1
pkgrel=1
pkgdesc="Tools for programming Nordic nRF51 MCU using J-Link"
arch=('i686' 'x86_64')
url="https://www.nordicsemi.com/eng/Products/Bluetooth-low-energy/nRF51822"
license=('unknown')
depends=('jlink-software-and-documentation')
provides=('nrfjprog')
conflicts=('nrfjprog')
options=()
source_i686=("nRF5x-Command-Line-Tools_${pkgver//./_}_Linux-i386.tar::https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/nRFCommandLineTools${pkgver//./}Linuxi386tar.gz")

source_x86_64=("nRF5x-Command-Line-Tools_${pkgver//./_}_Linux-x86-64.tar::https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/nRFCommandLineTools${pkgver//./}Linuxamd64tar.gz")

md5sums_i686=('6f05f33e3b5ddeded20de6a68de9504c')
md5sums_x86_64=('43d6e89d934be59ca41a5d7df7d10752')

package() {
    # Install nrfjprog and mergehex
    install -dm755 "${pkgdir}/opt/nrfjprog" "${pkgdir}/opt/mergehex" "$pkgdir/usr/bin"

    cd ${srcdir}
    cp --preserve=mode * "${pkgdir}/opt/nrfjprog"

    cd ${srcdir}
    cp --preserve=mode * "${pkgdir}/opt/mergehex"

	ln -s "/opt/nrfjprog/nrfjprog" "${pkgdir}/usr/bin"
	ln -s "/opt/mergehex/mergehex" "${pkgdir}/usr/bin"
}
