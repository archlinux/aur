# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=roonbridge
_pkgname=RoonBridge
pkgver=1.8.1125
pkgrel=2
_pkgrel_x86_64=1
_pkgrel_armv7h=1
_pkgrel_aarch64=1
pkgdesc="The music player for music lovers"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://roonlabs.com/"
license=('custom')
depends=('alsa-lib' 'glibc' 'ffmpeg' 'cifs-utils')
source=('roonbridge.service'
        'copyright')
source_x86_64=("http://download.roonlabs.net/builds/RoonBridge_linuxx64.tar.bz2")
source_armv7h=("http://download.roonlabs.net/builds/RoonBridge_linuxarmv7hf.tar.bz2")
source_aarch64=("http://download.roonlabs.net/builds/RoonBridge_linuxarmv8.tar.bz2")
sha256sums=('e24bfbb30142bcf819928c0cd87947ad2d988968aef4aa06e13f3abb578a1588'
            '31b6cac147644ad4d0908906b91e631752111939be88031e03da72182de5be93')
sha256sums_x86_64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_aarch64=('SKIP')
install=${pkgname}.install

pkgver() {
  grep build ${srcdir}/$_pkgname/VERSION | sed -e 's/ (build /./' -e 's/).*//' -e 's/ //g'
}

package() {
   cd "$srcdir"
   mkdir -p ${pkgdir}/opt/
   bsdtar xf RoonBridge_*.tar.bz2 -C "$pkgdir/opt"
  install -Dm644 "roonbridge.service"  "$pkgdir/usr/lib/systemd/system/roonbridge.service"
  install -Dm644 "copyright"           "$pkgdir/usr/share/licenses/$pkgname/COPYING"

}
