# Maintainer: Inky Quill

pkgname=galley-pad-bin
pkgver=1.4.0
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
sha256sums=("81f6ad91fbfe1942616c3f39295c2df0525fc5ddeaea46a778a7479082ab0ca8")

package() {
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" -C "${srcdir}" data.tar.gz
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
