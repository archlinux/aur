# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=virtualfish
pkgver=2.3.0
pkgrel=1
pkgdesc="Fish shell tool for managing Python virtual environments"
arch=("any")
url=https://github.com/justinmayer/virtualfish
license=("MIT")
depends=("python" "python-pkgconfig" "python-psutil" "python-virtualenv")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('6d06de09babbea541f694615f4f26eec00822e4b97650c4191639b6ef5210bb5')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

