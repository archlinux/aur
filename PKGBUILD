## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-embedded
_debpkgver=4.0.0a12-12_amd64
pkgver=4.0.0a12
pkgrel=1
pkgdesc="Signalyst HQPlayer Embedded
 HQPlayer - the high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/custom.html"
license=('custom')
install=$pkgname.install
depends=('alsa-lib' 'glibc' 'flac' 'gcc-libs' 'libgmpris' 'glib2')
optdepends=('rygel: for network access with upnp' 'minimserver: UPnP Audio server')
source=("https://www.signalyst.eu/bins/hqplayerd/xenial/hqplayerd_$_debpkgver.deb" 'start_hqplayerd.sh' 'hqplayerd_rygel.service' 'hqplayerd.service')
sha256sums=('SKIP'
'2c1a93ea66e59a7eee1b76fc70816bb9f6169b155eb42b390ecddb4b38b31ca5'
'649023546a37d074dab42ed90f29cb545be33bd3872f036cc4c14223db69a4a5'
'cdbe452da60e5ed2287d9b4658175d39fbe3a9fd3b2b15b89c6a50184571e6f9')

package() {
  bsdtar xf data.tar.xz -C "$srcdir"
     install -Dm644 "$srcdir/etc/hqplayer/hqplayerd.xml" \
    "$pkgdir/etc/hqplayer/hqplayerd.xml"
    
     install -Dm755 "$srcdir/usr/bin/hqplayerd" \
    "$pkgdir/usr/bin/hqplayerd"
    
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/readme.txt.gz" \
    "$pkgdir/usr/share/doc/hqplayerd/readme.txt.gz"
    
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/rygel.conf.gz" \
    "$pkgdir/usr/share/doc/hqplayerd/rygel.conf.gz"
  
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    
     install -Dm644 "hqplayerd_rygel.service" \
    "$pkgdir/usr/lib/systemd/user/hqplayerd_rygel.service"
    
     install -Dm644 "hqplayerd.service" \
    "$pkgdir/usr/lib/systemd/user/hqplayerd.service"
    
     install -Dm755 "start_hqplayerd.sh" \
    "$pkgdir/usr/bin/start_hqplayerd.sh"
}
