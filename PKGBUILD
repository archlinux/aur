# Maintainer: Gerry Demaret <oss plus archlinux at x-net dot be>
# Category: system
pkgname='vncdotool-git'
pkgver=1.0.0.r7.gc248393
pkgrel=1
pkgdesc='A command line VNC client'
arch=('any')
url='https://github.com/sibson/vncdotool'
license=('MIT')
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
    install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/vncdotool/LICENSE.txt"
}
