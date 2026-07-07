# Maintainer: Inky Quill

pkgname=galley-pad-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="Desktop Markdown editor for plain .md files"
arch=("x86_64")
url="https://github.com/InkyQuill/galley-pad"
license=("MIT")
depends=(
  "gtk3"
  "hicolor-icon-theme"
  "webkit2gtk-4.1"
)
provides=("galley-pad")
conflicts=("galley-pad")
options=("!strip")
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Galley.Pad_${pkgver}_amd64.deb")
sha256sums=("70772b070b5e564e824062f6154cca4b45519342689c63264f0a9c05294bc527")

package() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" -C "${srcdir}" data.tar.gz
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
