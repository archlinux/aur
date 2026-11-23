# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=audirvana-origin
pkgver=3.1.2
pkgrel=1
pkgdesc="Audirvana Origin audio player"
arch=('x86_64' 'aarch64')
url="https://audirvana.com/"
license=('custom')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'avahi' 'curl' 'libxml2')
source_x86_64=("https://audirvana.com/delivery/linux/apt-repo/pool/non-free/audirvana-origin/audirvana-origin_"$pkgver"_amd64.deb")
source_aarch64=("https://audirvana.com/delivery/linux/apt-repo/pool/non-free/audirvana-origin/audirvana-origin_"$pkgver"_arm64.deb")
source=('audirvanaOrigin.service')
sha256sums=('2fbabeb03f921cf4f65993687e0669e544b37c5327d8df1e5f3e70de9b86d2e8')
sha256sums_x86_64=('acf7825328a1dab69b6d8f3bddb3d514bb77749a3604d5537aea6a1cafb152d0')
sha256sums_aarch64=('c2cb9dcadb228330aafee2f738958e7d48715b1f19afa0a773e8de7f64ee6e58')
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
