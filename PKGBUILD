# Maintainer: Brett Cornwall <ainola@archlinux.org>

pkgname=python-vipaccess
pkgver=0.11
pkgrel=1
pkgdesc="A free software implementation of Symantec's VIP Access application and protocol"
arch=('any')
url="https://github.com/dlenski/python-vipaccess"
license=('Apache')
makedepends=('python-setuptools')
checkdepends=('python-nose')
depends=('python-pycryptodome' 'python-lxml' 'python-oath' 'python-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dlenski/python-vipaccess/archive/v$pkgver.tar.gz")
sha256sums=('316d0ff3f8bebdce2c471dc4352db7a6fefe7286976378c2624166727671983c')

build() {
    cd "python-vipaccess-$pkgver"
    python setup.py build
}

check() {
    cd "python-vipaccess-$pkgver"
    python setup.py test
}

package_python-vipaccess() {
    cd "python-vipaccess-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
