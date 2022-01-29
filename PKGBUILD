# Maintainer: Felix Leblanc <felix.leblanc1305@gmail.com>
_name=tinytag
pkgname=python-$_name
pkgver=1.6.0
pkgrel=1
pkgdesc="Read music meta data and length of MP3, OGG, FLAC and Wave files"
arch=('any')
url="https://pypi.python.org/pypi/tinytag/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/devsnd/$_name/archive/$pkgver.tar.gz")
md5sums=('183731563cf2fe9e104be86595e937ae')
validpgpkeys=()

check() {
    cd "$srcdir/$_name-$pkgver"
    python runtests.py
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
