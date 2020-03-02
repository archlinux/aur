# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=desec-dns-cli
_name=${pkgname//-/_}
pkgver=0.0.2
pkgrel=2
pkgdesc="CLI tool for the desec.io DNS service"
arch=("any")
url=https://gitlab.com/XenGi/desec-dns-cli
license=("MIT")
depends=("python>=3.6" "python-click")
makedepends=("python-setuptools")
#checkdepends=("python-pytest" "python-pytest-xdist" "python-pytest-flake8")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_name-$pkgver.tar.gz")
sha256sums=('d61d8133403e0303af4180041858b659effcfc944980a788fcaccd7b51eee1c2')

#check() {
#    cd "$srcdir/$_name-$pkgver"
#    pytest --flake8 tests/
#}

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

