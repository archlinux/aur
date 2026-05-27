pkgname=routa-bin
pkgver=0.18.1
pkgrel=1
pkgdesc="Routa.js Desktop - Multi-agent coordination platform"
arch=('x86_64')
url="https://github.com/phodal/routa"
license=('MIT')

depends=(
  'libayatana-appindicator'
  'webkit2gtk-4.1'
  'gtk3'
)

source=("${url}/releases/download/v${pkgver}/Routa.Desktop_${pkgver}_amd64.deb")
sha256sums=('42e7fa376ba0b204b0b10794ce26a68fee081309292b312e03ef916e6b63ef9e')

prepare() {
  cd "$srcdir"

  ar x "Routa.Desktop_${pkgver}_amd64.deb"

  mkdir extract
  bsdtar -xf data.tar.* -C extract
}

package() {
  cp -a "$srcdir/extract/." "$pkgdir/"
}

