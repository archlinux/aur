# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

_name=sphinx-math-dollar
pkgname="python-$_name"
pkgver=1.1.1
pkgrel=1
pkgdesc='Sphinx extension to let you write LaTeX math using $$'
arch=('any')
url="https://github.com/sympy/$_name"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_name"
  python setup.py build
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # the setup.py also installs tests, thus remove them
  rm -R "$pkgdir/usr/lib/python3.8/site-packages/sphinx_math_dollar/tests/"
}
