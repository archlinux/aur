# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=roonserver
pkgver=1.2
pkgrel=1
pkgdesc="The music player for music lovers"
arch=('x86_64')
url="https://roonlabs.com/"
license=('custom')
depends=('alsa-lib' 'glibc' 'ffmpeg' 'cifs-utils')
source=("http://download.roonlabs.com/builds/RoonServer_linuxx64.tar.bz2" 'roonserver.service' 'copyright')
sha256sums=('SKIP' '7ac838aad87b9632d2dea02356ab63f9fd26ab239e7e272fa25914a380b5b38a' '31b6cac147644ad4d0908906b91e631752111939be88031e03da72182de5be93')

package() {
   cd "$srcdir"
   mkdir -p ${pkgdir}/opt/
   bsdtar xf RoonServer_linuxx64.tar.bz2 -C "$pkgdir/opt"
   install -Dm644 "roonserver.service" \
    "$pkgdir/usr/lib/systemd/system/roonserver.service"
   install -Dm644 "copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
