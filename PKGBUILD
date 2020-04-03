# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=virtualfish
pkgver=2.0.1
pkgrel=1
pkgdesc="Fish shell tool for managing Python virtual environments"
arch=("any")
url=https://github.com/justinmayer/virtualfish
license=("MIT")
depends=("python" "python-pkgconfig" "python-psutil" "python-virtualenv" "python-xdg")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('18be951a4997cd58ed6861f1d833390b63bb631a2c31933dc3e713e63ea80b6b')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

