# Maintainer: Alad Wenter <alad@archlinux.org>
# Contributor: John Jenkins twodopeshaggy@gmail.com
# Contributor: Sean Anderson seanga2@gmail.com
pkgname=python-kitchen
pkgver=1.2.6
pkgrel=5
pkgdesc="Useful snippets of python code"
url="https://github.com/fedora-infra/kitchen"
depends=('python')
makedepends=('python-setuptools')
license=('LGPL')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6963dd84819713aafdd55e5314dcce6df5a37430b62fd9c48770e9f1a467b2b0')

build() {
    cd "kitchen-$pkgver"
    python setup.py build
}

package() {
    cd "kitchen-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
