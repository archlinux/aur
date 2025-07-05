# Maintainer: KozaKrisz <hello@kozakrisz.dev>

_pkgname=pacmanager
pkgname=${_pkgname}-bin
pkgver=0.1.4             
pkgrel=1
pkgdesc="This application provides a user-friendly graphical interface for managing both official Arch Linux packages via pacman and AUR (Arch User Repository) packages via yay."
arch=('x86_64')
url="https://github.com/KriszKecskes/pacmanager"
license=('custom')       
depends=('gtk3' 'webkit2gtk' 'libayatana-appindicator' 'openssl-1.1') 
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")

sha256sums=('f5c5936e32be9fd7bb016c93b1a12e806bb83981b2d1caca64831c8c0ccbaada')

package() {
  bsdtar -x -f "${srcdir}/${_pkgname}-${pkgver}.deb" -C "${srcdir}"
  bsdtar -x -f "${srcdir}/data.tar."* -C "${pkgdir}"
}