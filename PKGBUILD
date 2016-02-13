# Maintainer: Felix Leblanc <felix.leblanc1305@gmail.com>
_name=tinytag
pkgname=python-$_name
pkgver=0.9.3
pkgrel=2
pkgdesc="Read music meta data and length of MP3, OGG, FLAC and Wave files"
arch=('any')
url="https://pypi.python.org/pypi/tinytag/"
license=('GPL')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://github.com/devsnd/$_name/archive/$pkgver.tar.gz")
md5sums=('42fe94f62558fcd4e2023c289472d3ac')
validpgpkeys=()

check() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py nosetests
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
