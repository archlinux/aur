# Maintainer: Vivien Maisonneuve <v dot maisonneuve at gmail dot com>
# Category: system
pkgname='vncdotool-git'
pkgver=0.10.0.r42.g801b0d3
pkgrel=1
pkgdesc='A command line VNC client'
arch=('any')
url='https://github.com/sibson/vncdotool'
license=('custom')
depends=('python-pillow' 'python-twisted' 'python-zope-interface')
provides=('vncdotool')
conflicts=('vncdotool')
source=('git+https://github.com/sibson/vncdotool.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/vncdotool"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/vncdotool"
    python setup.py install --root="$pkgdir/" --optimize=1
}
