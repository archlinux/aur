# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pipgrip
pkgver=0.7.1
pkgrel=1
pkgdesc="Lightweight pip dependency resolver with deptree preview functionality based on the PubGrub algorithm"
arch=('any')
url="https://github.com/ddelange/pipgrip"
license=('BSD')
depends=('python-anytree' 'python-click' 'python-pip' 'python-packaging' 'python-pkginfo'
         'python-setuptools' 'python-wheel')
makedepends=('python-setuptools-scm')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('894c864788562babb1845c74d9887c93956e5ccaf7410c08c1934bae5e9737af')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
