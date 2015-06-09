# Maintainer: Thomas Weißschuh <thomas t-8ch.de>

pkgname=khal
pkgver=0.5.0
pkgrel=2
pkgdesc='CLI calendar application build around CalDAV'
arch=('any')
url='http://lostpackets.de/khal/'
license=('MIT')
depends=('python2-urwid' 'python2-vdirsyncer' 'python2-tzlocal'
         'python2-click' 'python2-configobj' 'python2-icalendar' 'python2-xdg')
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

sha256sums=('a992d9391f4af2c67fd6b3efaa03b299b423045c604142b2074ee90d98dd8280')
