# Maintainer: KozaKrisz <hello@kozakrisz.dev>

_pkgname=pacmanager
pkgname=${_pkgname}-bin
pkgver=0.1.2             
pkgrel=1
pkgdesc="This application provides a user-friendly graphical interface for managing both official Arch Linux packages via pacman and AUR (Arch User Repository) packages via yay."
arch=('x86_64')
url="https://github.com/KriszKecskes/pacmanager"
license=('custom')       
depends=('gtk3' 'webkit2gtk' 'libayatana-appindicator' 'openssl-1.1') 
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")

sha256sums=('5aa7bae417c4272d61d8e9c6db890c4914e50831d7f13d48e2ba0ed0583bdaa8')

package() {
  bsdtar -x -f "${srcdir}/${_pkgname}-${pkgver}.deb" -C "${srcdir}"
  bsdtar -x -f "${srcdir}/data.tar."* -C "${pkgdir}"
}