## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-embedded
_debpkgver=4.1.3-10_amd64
pkgver=4.1.3
pkgrel=3
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
'47030c3d91eb5a87e990fdc3962577579baf27fc1e8ea5036bedd365f8f02dcf'
'bea161aba1e103790a00a4abd06e648038b1d4fd377c5f7c0aa66638b8e9bbdc')

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
