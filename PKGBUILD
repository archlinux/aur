# Maintainer: Vivien Maisonneuve <v dot maisonneuve at gmail dot com>
# Category: system
pkgname='vncdotool-git'
pkgver=0.9.0.r8.g664c318
pkgrel=1
pkgdesc='A command line VNC client'
arch=('any')
url='https://github.com/sibson/vncdotool'
license=('custom')
depends=('python2-pillow' 'python2-twisted' 'python2-wsgiref' 'python2-zope-interface')
provides=('vncdotool')
conflicts=('vncdotool')
source=('git+https://github.com/sibson/vncdotool.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/vncdotool"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/vncdotool"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
