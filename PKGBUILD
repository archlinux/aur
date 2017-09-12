# Maintainer: Sherlock Holo <Sherlockya@gmail.com>
pkgname=python-locust-git
_pkgname=locust
pkgver=v0.8a1.82.g8c4eeae
pkgrel=1
pkgdesc="An easy-to-use, distributed, user load testing tool."
arch=('any')
url="http://locust.io/"
license=('MIT')
depends=('python-gevent' 'python-flask' 'python-requests' 'python-msgpack')
makedepends=('git')
source=('git://github.com/locustio/locust.git')
md5sums=('SKIP') # skip git source checksum

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed "s/-/./g"
}

build() {
    cd $srcdir/$_pkgname
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname
    python setup.py install --root=${pkgdir}/ --optimize=1
}
