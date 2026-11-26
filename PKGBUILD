# Maintainer: Inky Quill

pkgname=galley-pad-bin
pkgver=1.9.2
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
sha256sums=("f564d25d8a9141b87de145273b832e1cc165b00ffe3105a5f169775a266f59f8")

package() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" -C "${srcdir}" data.tar.gz
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
