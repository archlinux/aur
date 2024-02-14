# Maintainer: Brett Cornwall <ainola@archlinux.org>

pkgname=python-vipaccess
pkgver=0.14.2
pkgrel=1
pkgdesc="A free software implementation of Symantec's VIP Access application and protocol"
arch=('any')
url="https://github.com/dlenski/python-vipaccess"
license=('Apache')
makedepends=('python-setuptools')
checkdepends=('python-nose2')
depends=('python-pycryptodome' 'python-lxml' 'python-oath' 'python-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dlenski/python-vipaccess/archive/v$pkgver.tar.gz")
sha256sums=('77c296d20aa59b96893d80a50cd5b5f3a2db17599a19becece2dc123acc388a9')

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
