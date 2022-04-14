# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

_pkgname="empca"
_commit="c34abb3f7a2bed4baaf25f15f00791d5f60f8be8"
pkgname=python-empca
pkgver=0.2
pkgrel=3
pkgdesc="Weighted Expectation Maximization PCA"
arch=(any)
url="https://github.com/sbailey/empca"
license=('BSD')
depends=('python')
source=("$_pkgname-$_commit"::"https://github.com/sbailey/${_pkgname}/archive/$_commit.zip")
sha256sums=('8fcd350cb1e7fcb6761a8ea4c6de81715f9203a15d2c03f1e1afaa4aafd214a8')

package() {
  cd "$srcdir/${_pkgname}-$_commit"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -dm755 "$pkgdir/$site_packages"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 empca.py "$pkgdir/$site_packages/empca.py"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}

