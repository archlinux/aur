# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-nose-exclude
pkgver=0.5.0
pkgrel=11
pkgdesc="Exclude specific directories from nosetests runs"
arch=('any')
url="https://github.com/kgrandis/nose-exclude"
license=('LGPL')
depends=('python-nose')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kgrandis/nose-exclude/archive/$pkgver.tar.gz")
sha512sums=('0d8a21687831c825524c0cbb2da5b2195482558e2d2b0088944ccdf2d74787353f350ebbece8c4ce80f576426767ecb670afccbaf9f850e8476e1d2260bcc381')

build() {
  cd nose-exclude-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd nose-exclude-$pkgver
  nosetests tests
}

package() {
  cd nose-exclude-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
