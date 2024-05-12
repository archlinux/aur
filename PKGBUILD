# Maintainer: tijko <tijko1@proton.me>

pkgname=netlink
pkgver=0.0.9
pkgrel=1
pkgdesc='asynchronous implementation of the Linux netlink protocol'
arch=('x86_64')
url='https://github.com/tijko/netlink'
license=('GPL')
depends=('python' 'python-trio')
makedepends=('python-setuptools')
source=("$pkgname-$arch-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$arch-$pkgver.tar.gz")
sha512sums=('00d8184deace851433768f485c32b0c08f68a1f1d2cd281ff7c73e690325c7c04acca7b85f6f5d86db6b93405f1dccc8ce5637fa4883f81074bd27f5af0a01e4')

build() {
  python setup.py build
}

package() {
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}