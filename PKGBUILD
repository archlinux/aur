# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=khal
pkgver=0.6.0
pkgrel=1
pkgdesc='CLI calendar application build around CalDAV'
arch=('any')
url='http://lostpackets.de/khal/'
license=('MIT')
depends=('python2-urwid' 'python2-vdirsyncer' 'python2-tzlocal'
         'python2-click' 'python2-configobj' 'python2-icalendar' 'python2-xdg'
         'python2-pkginfo')
optdepends=('python2-setproctitle')
source=("http://pypi.python.org/packages/source/k/khal/khal-${pkgver}.tar.gz")


build() {
    cd "$srcdir/khal-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/khal-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('1a2e8d56d20b12ed2c3ef2468ff0ce0c658a8a566b249821b0f4b30cce8ada9a')
