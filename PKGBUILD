# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=roonbridge
pkgver=1.0
pkgrel=2
pkgdesc="The music player for music lovers"
arch=('x86_64')
url="https://roonlabs.com/"
license=('custom')
depends=('alsa-lib' 'glibc' 'ffmpeg' 'cifs-utils')
source=("http://download.roonlabs.com/builds/RoonBridge_linuxx64.tar.bz2" 'roonbridge.service' 'copyright')
sha256sums=('SKIP' '1d1fafdabcdb1c2496e5704481cac1fad2fe2347646e1987176f1b3ce5d288f6' '31b6cac147644ad4d0908906b91e631752111939be88031e03da72182de5be93')

package() {
   cd "$srcdir"
   mkdir -p ${pkgdir}/opt/
   bsdtar xf RoonBridge_linuxx64.tar.bz2 -C "$pkgdir/opt"
   install -Dm644 "roonbridge.service" \
    "$pkgdir/usr/lib/systemd/system/roonbridge.service"
   install -Dm644 "copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
