# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=virtualfish
pkgver=2.5.4
pkgrel=3
pkgdesc="Fish shell tool for managing Python virtual environments"
arch=("any")
url=https://github.com/justinmayer/virtualfish
license=("MIT")
depends=("fish>=3.1" "python>=3.6.2" "python-packaging>=21.3" "python-pkgconfig>=1.5" "python-psutil>=5.7" "python-virtualenv>=20")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('c8e256586d7a45ca461134a18d2fecfb7df7d32c104e9bd84d82570c6ef2ac3e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

