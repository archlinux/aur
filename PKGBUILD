# Contributor: Adria Arrufat <swiftscythe@gmail.com>
pkgname=mpdris
pkgver=0.1.2
pkgrel=2
pkgdesc="An implementation of the XMMS2 media player interface MPRIS as a client for MPD"
arch=('i686' 'x86_64')
url="http://ayeon.org/projects/mpDris/"
license=('GPL')
depends=('dbus-python>=0.80' 'pygobject>=2.14' 'python2-mpd>=0.2.0')
optdepends=('mpd: the Music Player Daemon')
makedepends=('subversion')
backup=(etc/mpDris.conf)
source=('http://ayeon.org/projects/mpDris/mpDris-0.1.2.tar.bz2')
md5sums=('c4b94b119592474e387f8a988f6ce7d3')

build() {
  cd "$srcdir/mpDris-$pkgver"

  python2 setup.py install --root=$pkgdir
  sed "1s/python/&2/" $pkgdir/usr/bin/mpDris
  install -m 0644 -D mpDris.conf $pkgdir/etc/mpDris.conf
}
