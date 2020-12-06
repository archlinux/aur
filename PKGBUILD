# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=virtualfish
pkgver=2.5.1
pkgrel=1
pkgdesc="Fish shell tool for managing Python virtual environments"
arch=("any")
url=https://github.com/justinmayer/virtualfish
license=("MIT")
depends=("python-pkgconfig" "python-psutil" "python-virtualenv")
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9ccc57ac9e3fa9d58cfdddbe4a76ec8be37be2a75cb12f3ccbfaa6ef19c1899f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    depends=("fish>=3.1")

    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

