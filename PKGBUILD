# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=rstcheck
pkgver=3.2
pkgrel=1
pkgdesc='Checks syntax of reStructuredText and code blocks nested within it'
arch=('any')
url=https://github.com/myint/rstcheck
license=('MIT')
depends=('python-docutils')
optdepends=('python-sphinx: Sphinx support')
source=("https://files.pythonhosted.org/packages/source/r/rstcheck/rstcheck-$pkgver.tar.gz")
sha512sums=('eb7be5a612673242e56570796b0f324f0300b55726ac705c58b9d96a9b6e200a75c03e741033081a849012c7838ffad31265cb18cc34f95423a55b0d3bddefc0')

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
