# Maintainer: Fernando Ortiz <nandub+arch@nandub.info>

pkgbase=python-doitlive
pkgname=(python-doitlive)
pkgver=4.4.0
pkgrel=1
pkgdesc="Because sometimes you need to do it live"
arch=("any")
url="https://github.com/sloria/doitlive"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/sloria/doitlive/archive/$pkgver.tar.gz")
sha256sums=('cf1d08cdbb3c8c9bec4472c586688210164b3175d5eaddb32682da6f6b385a69')

build() {
  # build for python 3
  cd doitlive-$pkgver
  python setup.py build
}

# package for python 3
package_python-doitlive() {
  depends=('python' 'python-click-didyoumean' 'python-click-completion')
  pkgdesc+=" for Python 3"

  cd doitlive-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
