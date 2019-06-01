# Maintainer: Ainola

pkgname=python-vipaccess
pkgver=0.10.1
pkgrel=1
pkgdesc="A free software implementation of Symantec's VIP Access application and protocol."
arch=('any')
url="https://github.com/dlenski/python-vipaccess"
license=('Apache')
makedepends=('python-setuptools')
checkdepends=('python-nose')
depends=('python-pycryptodome' 'python-lxml' 'python-oath' 'python-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dlenski/python-vipaccess/archive/v$pkgver.tar.gz")
sha256sums=('c48b92554e9e08d1c6e4a25f7c10cf7d97346a963a7adf0e4a99eaf98b68f98f')

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
