# Maintainer: Xuepoo
# This file is a template: CI (.github/workflows/release.yml, publish-aur job)
# substitutes 0.1.0 / https://github.com/vemjs/vem-desktop/releases/download/v0.1.0/Vem_0.1.0_amd64.deb and writes the result to PKGBUILD before
# running updpkgsums + makepkg --printsrcinfo. Don't hand-edit a generated
# PKGBUILD in the AUR checkout; edit this template and cut a new release.
pkgname=vem
pkgver=0.1.0
pkgrel=1
pkgdesc="A next-generation Vim editor powered by VectoJS, running natively via Tauri"
arch=('x86_64')
url="https://vem.run"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg')
provides=('vem')
conflicts=('vem')
options=('!strip')
source=("vem-${pkgver}.deb::https://github.com/vemjs/vem-desktop/releases/download/v0.1.0/Vem_0.1.0_amd64.deb")
sha256sums=('db1afae2a832b5329db7daa0677a8f843d84a401db4b8de85e80f53b6860ad7f')

package() {
  bsdtar -xf "${srcdir}/vem-${pkgver}.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"
}
