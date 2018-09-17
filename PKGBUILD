## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-embedded
_debpkgver=4.4.0-16_amd64
pkgver=4.4.0
pkgrel=1
pkgdesc="Signalyst HQPlayer Embedded
 HQPlayer - the high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/custom.html"
license=('custom')
install=$pkgname.install
depends=('alsa-lib' 'glibc' 'flac' 'gcc-libs' 'libgmpris' 'glib2' 'rygel')
source=("https://www.signalyst.eu/bins/hqplayerd/xenial/hqplayerd_$_debpkgver.deb" 'hqplayerd.service')
sha256sums=('SKIP'
'ba3ce43cda349ec5fee4049405554ec076ff56beef5ff575bf79b673ce0de7e4')

package() {
  bsdtar xf data.tar.xz -C "$srcdir"
     install -Dm644 "$srcdir/etc/hqplayer/hqplayerd.xml" \
    "$pkgdir/usr/share/doc/hqplayerd/hqplayerd.xml"
    
     install -Dm644 "$srcdir/var/hqplayer/web/default.css" \
    "$pkgdir/var/hqplayer/web/default.css"
    
    install -Dm644 "$srcdir/var/hqplayer/web/favicon.ico" \
    "$pkgdir/var/hqplayer/web/favicon.ico"
    
     install -Dm755 "$srcdir/usr/bin/hqplayerd" \
    "$pkgdir/usr/bin/hqplayerd"
    
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/readme.txt.gz" \
    "$pkgdir/usr/share/doc/hqplayerd/readme.txt.gz"
    
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/rygel.conf.gz" \
    "$pkgdir/usr/share/doc/hqplayerd/rygel.conf.gz"
    
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/hqplayerd.xml-rmeaio" \
    "$pkgdir/usr/share/doc/hqplayerd/hqplayerd.xml-rmeaio"
  
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    
     install -Dm644 "hqplayerd.service" \
    "$pkgdir/usr/lib/systemd/user/hqplayerd.service"
}
