# Maintainer: Sherlock Holo <sherlockya@gmail.com>

pkgname=python-pysodium
_pkgname=pysodium
pkgver=0.6.13
pkgrel=1
pkgdesc="Python wrapper for libsodium"
arch=('any')
depends=('libsodium' 'python' 'python-cffi')
makedepends=('python-setuptools')
url="https://github.com/stef/pysodium"
license=('BSD')
options=(!emptydirs)
source=(https://pypi.python.org/packages/b4/ec/9e9918b5dcf37b5b5c7554cb9eb655a4282c47d8c9d9adf99c219bee7d24/pysodium-0.6.13.tar.gz)
sha256sums=('4091bdb7bff79e6f2da07bbc92d08c9076a77ddb3d5f73d283ce68b0438deeb3')

build() {
    cd "$srcdir"
    bsdtar -xvf $_pkgname-$pkgver.tar.gz
    cd $_pkgname-$pkgver
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
