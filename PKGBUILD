# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=audirvana-origin
pkgver=3.0.3
pkgrel=1
pkgdesc="Audirvana Origin audio player"
arch=('x86_64')
url="https://audirvana.com/"
license=('custom')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'avahi' 'curl' 'libxml2')
source=("https://audirvana.com/delivery/linux/apt-repo/pool/non-free/audirvana-origin/audirvana-origin_"$pkgver"_amd64.deb" 'audirvanaOrigin.service')
sha256sums=('b20af2fddc3d549d1a168e30995753de508cb91bd8bbf692f7eb0a84dc9c3bac' 
'2fbabeb03f921cf4f65993687e0669e544b37c5327d8df1e5f3e70de9b86d2e8')
install=${pkgname}.install

package() {
bsdtar xf data.tar.gz -C "$pkgdir"
install -Dm644 "audirvanaOrigin.service" "$pkgdir/usr/lib/systemd/user/audirvanaOrigin.service"
install -Dm644 "$pkgdir/opt/audirvana/origin/share/CREDITS" "$pkgdir/usr/share/licenses/$pkgname/CREDITS"
install -Dm644 "$pkgdir/opt/audirvana/origin/share/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
rm -rf "$pkgdir/opt/audirvana/origin/share/etc"
rm -f "$pkgdir/opt/audirvana/origin/share/CREDITS"
rm -f "$pkgdir/opt/audirvana/origin/share/LICENSE"
}
