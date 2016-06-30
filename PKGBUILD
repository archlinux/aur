# Maintainer: Marco Asa <marcoasa90[at]gmail[dot]com>
# Contributor: Christopher Arndt <chris at chrisarndt.de>

pkgname=linux-show-player
pkgver=0.4.1
pkgrel=1
pkgdesc="sound cue playback software designed for live musical shows and theatre plays"
url="http://linux-show-player.sourceforge.net/"
arch=('any')
license=('GPL3')
depends=('python-pyqt5' 'python-gobject' 'gst-plugins-good'
         'python-setuptools' 'python-sortedcontainers')
optdepends=('portmidi: for portmidi support'
            'gst-libav: for larger format support')
source=("https://github.com/FrancescoCeruti/${pkgname}/archive/0.4-fix1.tar.gz")
md5sums=('3540ce8137771eabce5122ba5c19e7fc')

package() {
  cd "$srcdir/$pkgname-0.4-fix1"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  mkdir -p "$pkgdir/usr/share/mime/packages"
  cp dist/linux-show-player.desktop "$pkgdir/usr/share/applications/"
  cp dist/linux_show_player.png "$pkgdir/usr/share/pixmaps/"
  cp dist/linux-show-player.xml "$pkgdir/usr/share/mime/packages/"
}
