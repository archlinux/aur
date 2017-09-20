# Maintainer: Felix Leblanc <felix.leblanc1305@gmail.com>
_name=tinytag
pkgname=python-$_name
pkgver=0.18.0
pkgrel=2
pkgdesc="Read music meta data and length of MP3, OGG, FLAC and Wave files"
arch=('any')
url="https://pypi.python.org/pypi/tinytag/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://github.com/devsnd/$_name/archive/$pkgver.tar.gz")
md5sums=('7349592e78dfa539249f368cc83dc033')
validpgpkeys=()

check() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py nosetests
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
