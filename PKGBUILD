# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=rstcheck
pkgver=3.3.1
pkgrel=1
pkgdesc='Checks syntax of reStructuredText and code blocks nested within it'
arch=('any')
url=https://github.com/myint/rstcheck
license=('MIT')
depends=('python-docutils' 'python-setuptools')
optdepends=('python-sphinx: Sphinx support')
source=("https://files.pythonhosted.org/packages/source/r/rstcheck/rstcheck-$pkgver.tar.gz")
sha512sums=('d390565c59466e1047fb41491eb5a2261fec91848806e04137bcc6053759fc87c8e4c72721d39b35c959b0baddaf90f2c8459213cec76b82be9b78bdd44076c5')

build() {
  cd rstcheck-$pkgver
  python setup.py build
}

package() {
  cd rstcheck-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/rstcheck LICENSE
}

# vim:set ts=2 sw=2 et:
