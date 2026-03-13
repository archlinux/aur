# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=audirvana-origin
pkgver=2.6.5
pkgrel=1
pkgdesc="Audirvana Origin audio player"
arch=('x86_64')
url="https://audirvana.com/"
license=('custom')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'avahi' 'curl' 'libxml2')
source=("https://audirvana.com/delivery/linux/apt-repo/pool/non-free/audirvana-origin/audirvana-origin_"$pkgver"_amd64.deb" 'audirvanaOrigin.service')
sha256sums=('93376ee6914ed6459488237f961bbe84c17eeb8eaaeeca62941b61d29414f660' 
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
