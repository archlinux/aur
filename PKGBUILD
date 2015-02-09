# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>
pkgname=asciiplanets-git
pkgver=f7e3d1f
pkgrel=1
pkgdesc="ASCII solar system observer"
arch=('any')
url="https://github.com/vain/asciiplanets"
license=('custom:PIZZA-WARE')
depends=('python-pyephem')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git://github.com/vain/asciiplanets.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --always | sed 's|-|.|g; s|v||'
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm755 asciiplanets "$pkgdir"/usr/bin/asciiplanets

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"
}
