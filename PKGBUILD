# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=xpybar
pkgver=1.18.1
pkgrel=1
pkgdesc="A highly extensible minimalistic dock panel configured in Python 3"
arch=(any)
url="https://github.com/maandree/xpybar"
license=('GPL3' 'AGPL3')
depends=(python3 argparser-python 'python-xlib>=0.18' xorg-xrandr)
optdepends=("alarm: for limiting the time of a file search in locks"
            "curl: for Internet services"
	    "file: for image support"
	    "findutils: for file search in locks"
	    "graphicsmagick: for image support"
	    "hdparm: hdparm: for hdparm support"
	    "ii: for ii support"
	    "imagemagick: for image support"
	    "inotify-tools: for ii and inotify support"
	    "iputils: for ping support"
	    "librsvg: for image support"
	    "linux: most of the monitors require Linux's procfs or sysfs"
	    "pdeath: for automatic killing of child processes on exit"
	    "python-pyalsaaudio: for ALSA volume control"
	    "python-pytz: for timezone support"
	    "python-sysv-ipc: for ropty example"
	    "solar-python>=2.5: for solar data")
makedepends=(make coreutils sed zip auto-auto-complete texinfo)
install=xpybar.install
source=($url/archive/$pkgver.tar.gz)
sha256sums=(e4fed5d35b6ba98eb05163bd897475262457080a3a36e36f0327932eb18dc97c)


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr HDPARM_PATH=/usr/bin/hdpath
}


package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr HDPARM_PATH=/usr/bin/hdpath install DESTDIR="$pkgdir"
  chmod 4755 "$pkgdir/usr/bin/restricted-hdparm"
}

