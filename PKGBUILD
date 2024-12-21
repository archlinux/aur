# Maintainer: Christian Mauderer <oss@c-mauderer.de>
pkgname=ttf-2of5-font-git
_pkg=ttf-2of5-font
pkgrel=1
pkgver=r9.41dfb9d
pkgdesc='Font encoding the interleaved 2of5 barcode standard.'
arch=('any')
url='https://github.com/Holger-Will/2of5-font'
license=('GPL-3.0-only')
makedepends=('git')
source=("${pkgname}"::"git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/" "${srcdir}/${pkgname}/fonts/"*.ttf
  install -Dm644 -t "$pkgdir/usr/share/doc/${_pkg}/data/README.md" "${srcdir}/${pkgname}/README.md"
}
