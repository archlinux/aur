# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=roonserver
pkgver=1.6
pkgrel=3
pkgdesc="The music player for music lovers"
arch=('x86_64')
url="https://roonlabs.com/"
license=('custom')
depends=('alsa-lib' 'glibc' 'ffmpeg' 'cifs-utils')
source=("http://download.roonlabs.com/builds/RoonServer_linuxx64.tar.bz2" 'roonserver.service' 'copyright')
sha256sums=('SKIP' '37e646b7dfe98d6838ad765757ab0978a5d6c1caf97e9f8f508fbcd7e08f39d4' '31b6cac147644ad4d0908906b91e631752111939be88031e03da72182de5be93')

package() {
   cd "$srcdir"
   mkdir -p ${pkgdir}/opt/
   bsdtar xf RoonServer_linuxx64.tar.bz2 -C "$pkgdir/opt"
   chown -R root:root "$pkgdir/opt/RoonServer"
   install -Dm644 "roonserver.service" \
    "$pkgdir/usr/lib/systemd/system/roonserver.service"
   install -Dm644 "copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
