# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=rstcheck
pkgver=3.3
pkgrel=1
pkgdesc='Checks syntax of reStructuredText and code blocks nested within it'
arch=('any')
url=https://github.com/myint/rstcheck
license=('MIT')
depends=('python-docutils')
makedepends=('python-setuptools')
optdepends=('python-sphinx: Sphinx support')
source=("https://files.pythonhosted.org/packages/source/r/rstcheck/rstcheck-$pkgver.tar.gz")
sha512sums=('d5288adbd3853a0392679862edef65f8219476b8976446fd3ab5f9ec759437657d37f51125746648d5390300f6362a99fc86aa4303e2f009db715b92fe5086c8')

build() {
  cd rstcheck-$pkgver
  python setup.py build
}

package() {
  cd rstcheck-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/rstcheck/LICENSE
}

# vim:set ts=2 sw=2 et:
