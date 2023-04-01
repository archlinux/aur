# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-sphinxcontrib-seqdiag
pkgver=3.0.0
pkgrel=1
pkgdesc="A sphinx extension for embedding sequence diagram using seqdiag"
url="https://github.com/blockdiag/sphinxcontrib-seqdiag"
license=('BSD')
arch=('any')
depends=('blockdiag' 'seqdiag' 'python-sphinx')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-mock' 'python-reportlab' 'python-sphinx-testing')
source=("$pkgname-$pkgver.tar.gz::https://github.com/blockdiag/sphinxcontrib-seqdiag/archive/$pkgver.tar.gz")
sha512sums=('c66d823e264a75ebce4234fce24de7b308e98baa4aca080ee12baa3da8a20a0d6a667349a6ed1a8f26e31d01edf23f7e999707d2212f378db625f0b84cd009b1')

build() {
  cd sphinxcontrib-seqdiag-$pkgver
  python setup.py build
}

check() {
  cd sphinxcontrib-seqdiag-$pkgver
  python setup.py nosetests
}

package() {
  cd sphinxcontrib-seqdiag-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
