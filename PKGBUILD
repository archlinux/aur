# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=desec-dns-cli
_name=${pkgname//-/_}
pkgver=0.0.3
pkgrel=1
pkgdesc="CLI tool for the desec.io DNS service"
arch=("any")
url=https://gitlab.com/XenGi/desec-dns-cli
license=("MIT")
depends=("python>=3.6" "python-click" "python-desec-dns-api")
makedepends=("python-setuptools")
#checkdepends=("python-pytest" "python-pytest-xdist" "python-pytest-flake8")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_name-$pkgver.tar.gz")
sha256sums=('8c472b8bd1c6adb82e93378a41c4ddf7a536649d646358319f78e4e26e464d1b')

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

