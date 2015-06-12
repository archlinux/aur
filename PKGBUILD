# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=xpybar
pkgver=1.11.1
pkgrel=1
pkgdesc="A highly extensible minimalistic dock panel configured in Python 3"
arch=(any)
url="https://github.com/maandree/xpybar"
license=('GPL3' 'AGPL3')
depends=(python3 argparser python-xlib xorg-xrandr)
optdepends=("linux: most of the monitors require Linux's procfs or sysfs"
            "curl: for Internet services"
	    "python-pyalsaaudio: for ALSA volume control"
	    "hdparm: hdparm: for hdparm support"
	    "python-pytz: for timezone support"
	    "python-sysv-ipc: for ropty example"
	    "iputils: for ping support"
	    "inotify-tools: for inotify support"
	    "alarm: for limiting the time of a file search in locks"
	    "findutils: for file search in locks")
makedepends=(make coreutils sed zip)
source=($url/archive/$pkgver.tar.gz)
sha256sums=(bf5c50ed72745b85a0eeaef080f9ca7ea913fec46d3cc02c3f9a55f501037d8b)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr install DESTDIR="$pkgdir"
  chmod 4755 "$pkgdir/usr/bin/restricted-hdparm"
}

