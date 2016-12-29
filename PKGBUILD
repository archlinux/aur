# Maintainer: Zanny <lordzanny@gmail.com>
# First Linux Arch packager: Serge Victor <arch@random.re>

_name='flask-bootstrap'
pkgname=("python-$_name" "python2-$_name")
pkgver=3.3.7.0
pkgrel=1
pkgdesc="Ready-to-use Twitter-bootstrap for use in Flask."
arch=('any')
url="https://github.com/mbr/$_name"
license=('Apache')
makedepends=('python-setuptools')
source=("$url/archive/$pkgver.tar.gz")
md5sums=('e2e3d5962e6a45dd724917b52560dae8')
_vername="$_name-$pkgver"

prepare() {
    cp -a "$srcdir/$_vername"{,-python2}
}

package_python-flask-bootstrap() {
    depends=('python-flask' 'python-visitor' 'python-dominate')

    cd "$srcdir/$_vername"
    python3 setup.py install --root="$pkgdir" --optimize=1
}

package_python2-flask-bootstrap() {
    depends=('python2-flask' 'python2-visitor' 'python2-dominate')

    cd "$srcdir/$_vername-python2"
    python2 setup.py install --root="$pkgdir" --optimize=1
}
