# Maintainer: Konstantin Stepanov <me@kstep.me>
pkgname="python2-pushybullet"
pkgver="1.5.4"
pkgrel=1
pkgdesc="PushBullet APIv2 python bindings"
arch=('any')
url="http://github.com/kstep/pushybullet"
license=('GPL')
depends=('python2')
optdepends=('python2-websocket-client: read pushes stream in real-time'
            'python2-dateutil: parse datetime in string format'
            'python2-magic: file type autodetection')
source=(pushybullet.py pb setup.py)

build() {
    cd "$srcdir"
    python2 ./setup.py build
}

package() {
    cd "$srcdir"
    python2 ./setup.py install --root="$pkgdir" --skip-build --optimize=1
}

md5sums=('9596e1f55ea766bdd0e110b85bc6767a'
         '654983199a909516b9d643c3c1714190'
         'ddf1a4bf540c4c21044fe8ec50b76ef3')
