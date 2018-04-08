## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-embedded
_debpkgver=4.0.6-7_amd64
pkgver=4.0.6
pkgrel=1
pkgdesc="Signalyst HQPlayer Embedded
 HQPlayer - the high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/custom.html"
license=('custom')
install=$pkgname.install
depends=('alsa-lib' 'glibc' 'flac' 'gcc-libs' 'libgmpris' 'glib2')
optdepends=('rygel: for network access with upnp' 'minimserver: UPnP Audio server' 'nvidia-dkms: CUDA acceleration')
source=("https://www.signalyst.eu/bins/hqplayerd/xenial/hqplayerd_$_debpkgver.deb" 'start_hqplayerd.sh' 'hqplayerd_rygel.service' 'hqplayerd.service')
sha256sums=('SKIP'
'2c1a93ea66e59a7eee1b76fc70816bb9f6169b155eb42b390ecddb4b38b31ca5'
'2f9d355fb5979e8e79f64a40cdcae1e3783ecc6920a00ba7ecb298925379f29e'
'3141a29f9df4e4316107e2ffbb1adec6de8c1eb9b87d92701ba2a559f2290f1f')

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
    
     install -Dm644 "hqplayerd_rygel.service" \
    "$pkgdir/usr/lib/systemd/user/hqplayerd_rygel.service"
    
     install -Dm644 "hqplayerd.service" \
    "$pkgdir/usr/lib/systemd/user/hqplayerd.service"
    
     install -Dm755 "start_hqplayerd.sh" \
    "$pkgdir/usr/bin/start_hqplayerd.sh"
}
