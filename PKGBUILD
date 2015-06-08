# Maintainer: Ole Ernst <olebowle[at]gmx[dot]com>
pkgname=dvbsky-firmware
pkgver=20141128
pkgrel=1
pkgdesc="Firmware for DVBSky cards/boxes"
url="http://www.dvbsky.net/Support_linux.html"
arch=('any')
license=('unknown')
source=("http://www.dvbsky.net/download/linux/$pkgname.tar.gz")
md5sums=('b1aa72c5625e3deb9c8c9199d3b8789e')

#server doesn't like curl's user agent
DLAGENTS="$( IFS=$'\n'; echo "${DLAGENTS[*]}" | grep '^http::' ) --user-agent 'Mozilla/4.0'"

package() {
  cd "$srcdir/$pkgname"
  for file in *.fw; do
    install -Dm644 $file "$pkgdir/usr/lib/firmware/$file"
  done
}
