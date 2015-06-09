# Contributor: feilen <feilen1000@gmail.com>

pkgname=python2-sockjs-tornado-git
pkgver=1.0.0.r17.gb90116f
pkgrel=1
pkgdesc="SockJS-tornado is a Python server side counterpart of SockJS-client browser library running on top of Tornado framework."
arch=('any')
url="https://github.com/mrjoes/sockjs-tornado"
license=('MIT')
depends=( 'python2' 'python2-tornado' )
makedepends=( 'git' )
source=("$pkgname"::'git+https://github.com/mrjoes/sockjs-tornado.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$pkgname"

    python2 setup.py install --root="${pkgdir}" --optimize=1 || return 1
}
