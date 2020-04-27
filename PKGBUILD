# Maintainer: Felix Leblanc <felix.leblanc1305@gmail.com>
_name=tinytag
pkgname=python-$_name
pkgver=1.4.0
pkgrel=1
pkgdesc="Read music meta data and length of MP3, OGG, FLAC and Wave files"
arch=('any')
url="https://pypi.python.org/pypi/tinytag/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://github.com/devsnd/$_name/archive/$pkgver.tar.gz")
md5sums=('e4c424e98907db33fdf2757bf9ef6794')
validpgpkeys=()

check() {
    cd "$srcdir/$_name-$pkgver"
    python runtests.py
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
