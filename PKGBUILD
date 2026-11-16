# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=audirvana-origin
pkgver=3.1.1
pkgrel=2
pkgdesc="Audirvana Origin audio player"
arch=('x86_64' 'aarch64')
url="https://audirvana.com/"
license=('custom')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'avahi' 'curl' 'libxml2')
source_x86_64=("https://audirvana.com/delivery/linux/apt-repo/pool/non-free/audirvana-origin/audirvana-origin_"$pkgver"_amd64.deb")
source_aarch64=("https://audirvana.com/delivery/linux/apt-repo/pool/non-free/audirvana-origin/audirvana-origin_"$pkgver"_arm64.deb")
source=('audirvanaOrigin.service')
sha256sums=('2fbabeb03f921cf4f65993687e0669e544b37c5327d8df1e5f3e70de9b86d2e8')
sha256sums_x86_64=('fe1939aabdc9a8113abdb7ca6736ce5a1f5af33f14c73fde22e761921e7efcdd')
sha256sums_aarch64=('312fad1f6787f1cc526b1acef316fd93b07ec0f62207e6e1207ea496830db2d7')
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
