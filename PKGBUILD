## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-embedded
_debpkgver=4.20.1-56
pkgver=4.20.1
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="Signalyst HQPlayer Embedded
 HQPlayer - the high-end upsampling multichannel software HD-audio player"
arch=('x86_64' 'aarch64')
url="http://www.signalyst.com/custom.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'flac' 'gcc-libs' 'libgmpris' 'glib2' 'rygel' 'adduser-deb' 'zip' 'unzip')
source_x86_64=("https://www.signalyst.eu/bins/hqplayerd/focal/hqplayerd_"$_debpkgver"_amd64.deb" 'hqplayerd.service'  'hqplayerd2.service')
install=install
source_aarch64=("https://www.signalyst.eu/bins/hqplayerd/buster/hqplayerd_"$_debpkgver"_arm64.deb" 'hqplayerd.service'  'hqplayerd2.service')
sha256sums_x86_64=('SKIP'
'5d4194a704979b3ff92482e155769460906745a66e759142eba33a2226f9cb3a' '9b19b2236e342672a5e8d1e046623e3ba0d97ce4755134a371a100927dd9ed54')
sha256sums_aarch64=('SKIP'
'5d4194a704979b3ff92482e155769460906745a66e759142eba33a2226f9cb3a' '9b19b2236e342672a5e8d1e046623e3ba0d97ce4755134a371a100927dd9ed54')

package() {
  bsdtar xf data.tar.xz -C "$srcdir"
  
      install -Dm755 "$srcdir/usr/bin/hqplayerd" \
    "$pkgdir/usr/bin/hqplayerd"
    
      install -Dm755 "$srcdir/usr/bin/hqplayer-create-backup.sh" \
    "$pkgdir/usr/bin/hqplayer-create-backup.sh"
    
      install -Dm755 "$srcdir/usr/bin/hqplayer-restore-backup.sh" \
    "$pkgdir/usr/bin/hqplayer-restore-backup.sh"
    
     install -Dm644 "$srcdir/etc/hqplayer/hqplayerd.xml" \
    "$pkgdir/usr/share/doc/hqplayerd/hqplayerd.xml"
    
     mkdir -p "$pkgdir/etc/hqplayer"
    
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/readme.txt.gz" \
    "$pkgdir/usr/share/doc/hqplayerd/readme.txt.gz"
    
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/rygel.conf.gz" \
    "$pkgdir/usr/share/doc/hqplayerd/rygel.conf.gz"
    
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/hqplayerd.xml-rme.gz" \
    "$pkgdir/usr/share/doc/hqplayerd/hqplayerd.xml-rme.gz"
  
     install -Dm644 "$srcdir/usr/share/doc/hqplayerd/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    
     install -Dm644 "hqplayerd.service" \
    "$pkgdir/usr/lib/systemd/user/hqplayerd.service"
    
     install -Dm644 "hqplayerd2.service" \
    "$pkgdir/usr/lib/systemd/system/hqplayerd.service"
    
      install -Dm644 "$srcdir/var/hqplayer/web/default-cover.png" \
    "$pkgdir/var/hqplayer/web/default-cover.png"
    
     install -Dm644 "$srcdir/var/hqplayer/web/default.css" \
    "$pkgdir/var/hqplayer/web/default.css"
    
     install -Dm644 "$srcdir/var/hqplayer/web/favicon.ico" \
    "$pkgdir/var/hqplayer/web/favicon.ico"
    
     install -Dm644 "$srcdir/var/hqplayer/web/next.svg" \
    "$pkgdir/var/hqplayer/web/next.svg"
    
     install -Dm644 "$srcdir/var/hqplayer/web/pause.svg" \
    "$pkgdir/var/hqplayer/web/pause.svg"
    
     install -Dm644 "$srcdir/var/hqplayer/web/play.svg" \
    "$pkgdir/var/hqplayer/web/play.svg"
    
     install -Dm644 "$srcdir/var/hqplayer/web/prev.svg" \
    "$pkgdir/var/hqplayer/web/prev.svg"
    
     install -Dm644 "$srcdir/var/hqplayer/web/queue.svg" \
    "$pkgdir/var/hqplayer/web/queue.svg"
    
      install -Dm644 "$srcdir/var/hqplayer/web/stop.svg" \
    "$pkgdir/var/hqplayer/web/stop.svg"
    
      install -Dm644 "$srcdir/var/hqplayer/web/config.html" \
    "$pkgdir/var/hqplayer/web/config.html"
    
      install -Dm644 "$srcdir/var/hqplayer/web/convolution.html" \
    "$pkgdir/var/hqplayer/web/convolution.html"
    
      install -Dm644 "$srcdir/var/hqplayer/web/matrix.html" \
    "$pkgdir/var/hqplayer/web/matrix.html"
    
      install -Dm644 "$srcdir/var/hqplayer/web/speakers.html" \
    "$pkgdir/var/hqplayer/web/speakers.html"
    
     mkdir -p  "$pkgdir/var/hqplayer/home"
}
