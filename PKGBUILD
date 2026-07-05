# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=audirvana-studio
pkgver=3.3.0
pkgrel=1
pkgdesc="Audirvana Studio audio player"
arch=('x86_64')
url="https://audirvana.com/"
license=('custom')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'avahi' 'curl' 'libxml2')
source=("https://audirvana.com/delivery/linux/apt-repo/pool/non-free/audirvana-studio/audirvana-studio_"$pkgver"_amd64.deb" 'audirvanaStudio.service')
sha256sums=('089fb4ccea50d5403fc8c8d3137fd19c7362484c9e39f51b284bf09cc2c98114' 
'c677a4e78cd0f752babe89943f85f3e7a915f4657e7529abfc0a95ab5e26b5bd')
install=${pkgname}.install

package() {
bsdtar xf data.tar.gz -C "$pkgdir"
install -Dm644 "audirvanaStudio.service" "$pkgdir/usr/lib/systemd/user/audirvanaStudio.service"
install -Dm644 "$pkgdir/opt/audirvana/studio/share/CREDITS" "$pkgdir/usr/share/licenses/$pkgname/CREDITS"
install -Dm644 "$pkgdir/opt/audirvana/studio/share/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
#chmod 4755 "$pkgdir/opt/audirvana/studio/smb_mount_helper"
rm -rf "$pkgdir/opt/audirvana/studio/share/etc"
rm -f "$pkgdir/opt/audirvana/studio/share/CREDITS"
rm -f "$pkgdir/opt/audirvana/studio/share/LICENSE"
}
