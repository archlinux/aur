# Maintainer: sorrow
pkgname=python-xecli
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python CLI to manage xEclipsity tools and releases"
arch=('any')
url="https://github.com/xEclipsity/xecli"
license=('MIT')
depends=('python')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/source/p/xecli/xecli-${pkgver}.tar.gz")
sha256sums=('5022ef3cc59a4b5d0621dca4d3204a4618caa445a73ba7b62e7b61ab0f7ef52b')

build() {
    cd "$srcdir/xecli-${pkgver}"
    python -m pip install --upgrade build
}

package() {
    cd "$srcdir/xecli-${pkgver}"
    python -m pip install . --root="$pkgdir" --prefix=/usr --no-deps
}