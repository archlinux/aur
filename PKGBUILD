# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=virtualfish
pkgver=2.5.5
pkgrel=1
pkgdesc="Fish shell tool for managing Python virtual environments"
arch=("any")
url=https://github.com/justinmayer/virtualfish
license=("MIT")
depends=("fish" "python" "python-packaging" "python-pkgconfig" "python-psutil" "python-virtualenv")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6b654995f151af8fca62646d49a62b5bf646514250f1461df6d42147995a0db2')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

