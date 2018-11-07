# Maintainer: Ainola

pkgname=python-vipaccess
pkgver=0.9.0
pkgrel=3
pkgdesc="A free software implementation of Symantec's VIP Access application and protocol."
arch=('any')
url="https://github.com/dlenski/python-vipaccess"
license=('Apache')
makedepends=('python-setuptools' 'python-nose')
depends=('python-pycryptodome' 'python-lxml' 'python-oath' 'python-requests')
source=("$pkgname-$pkgver::https://github.com/dlenski/python-vipaccess/archive/v$pkgver.tar.gz")
sha256sums=('0a432d5f8bc8920a7adb9624f40ff8bd25a9f326bb1264462ad048faa6758c88')

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
