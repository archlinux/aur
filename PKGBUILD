# Maintainer: KozaKrisz <hello@kozakrisz.dev>

_pkgname=pacmanager
pkgname=${_pkgname}-bin
pkgver=0.1.1             
pkgrel=1
pkgdesc="This application provides a user-friendly graphical interface for managing both official Arch Linux packages via pacman and AUR (Arch User Repository) packages via yay."
arch=('x86_64')
url="https://github.com/KriszKecskes/pacmanager"
license=('custom')       
depends=('gtk3' 'webkit2gtk' 'libayatana-appindicator' 'openssl-1.1') 
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")

sha256sums=('d84ace72b7a4412a5a1621952f3db9b31442529641f09fb3ed548853415bfe60')

package() {
  bsdtar -x -f "${srcdir}/${_pkgname}-${pkgver}.deb" -C "${srcdir}"
  bsdtar -x -f "${srcdir}/data.tar."* -C "${pkgdir}"
}