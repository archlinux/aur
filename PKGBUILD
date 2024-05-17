# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=audirvana-origin
pkgver=2.5.12.6
pkgrel=1
pkgdesc="Audirvana Origin audio player"
arch=('x86_64')
url="https://audirvana.com/"
license=('custom')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'avahi' 'curl' 'libxml2')
source=("https://audirvana.com/delivery/linux/apt-repo/pool/non-free/audirvana-origin/audirvana-origin_"$pkgver"_amd64.deb" 'audirvanaOrigin.service')
sha256sums=('5fe0dadb21df71e6fb0c27c80c5cf5abcc4e90bd27d27565bc3cc801e7c2480a' 
'ad6c44ea90d96f13c8623f411b51138bc3deab7eeca476a0fbe51b2dbc0cb758')
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
