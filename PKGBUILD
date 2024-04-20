# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=audirvana-origin
pkgver=2.5.12.3
pkgrel=2
pkgdesc="Audirvana Origin audio player"
arch=('x86_64')
url="https://audirvana.com/"
license=('custom')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'avahi' 'curl' 'libxml2')
source=("https://audirvana.com/delivery/linux/apt-repo/pool/non-free/audirvana-origin/audirvana-origin_"$pkgver"_amd64.deb" 'audirvanaOrigin.service')
sha256sums=('32d72c3f09048eeed0e561be2e576b27cfc2d0785f45e47a6db5b94fe1cbb161' 
'3351b2af138c90f3eb058d7dabdbe38c73948748ba20dad22cd6294143596136')
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
