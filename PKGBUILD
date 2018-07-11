# Maintainer: Ole Martin Ruud <barskern@outlook.com>

_themename=simple-image
_pkgname="plymouth-theme-${_themename}"
pkgname="${_pkgname}-git"
pkgbase="${_pkgname}"
pkgver='0.1'
pkgrel=1
pkgdesc='A Plymouth theme which simply displays an image'
arch=('any')
license=('custom:BSD3-Clause')
url="https://github.com/barskern/${_pkgname}/"
depends=('plymouth')
makedepends=('git')
source=($_pkgname::"git+https://github.com/barskern/${_pkgname}.git")
sha256sums=('SKIP')
install="plymouth-theme-simple-image.install"

package() {
  cd $_pkgname

  _themedir="$pkgdir/usr/share/plymouth/themes/${_themename}"

  for file in img.png "${_themename}.plymouth" "${_themename}.script"; do
  	install -Dm644 $file "${_themedir}/$file"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
