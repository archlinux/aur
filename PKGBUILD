# Maintainer: KozaKrisz <hello@kozakrisz.dev>

_pkgname=pacmanager
pkgname=${_pkgname}-bin
pkgver=0.1.3             
pkgrel=1
pkgdesc="This application provides a user-friendly graphical interface for managing both official Arch Linux packages via pacman and AUR (Arch User Repository) packages via yay."
arch=('x86_64')
url="https://github.com/KriszKecskes/pacmanager"
license=('custom')       
depends=('gtk3' 'webkit2gtk' 'libayatana-appindicator' 'openssl-1.1') 
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")

sha256sums=('1f3c7761c3e176fcfa9ae82d43ace69a37591adfc1e26a9a1c38f3e7b19543cb')

package() {
  bsdtar -x -f "${srcdir}/${_pkgname}-${pkgver}.deb" -C "${srcdir}"
  bsdtar -x -f "${srcdir}/data.tar."* -C "${pkgdir}"
}