# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=audirvana-studio
pkgver=3.4.2
pkgrel=1
pkgdesc="Audirvana Studio audio player"
arch=('x86_64' 'aarch64')
url="https://audirvana.com/"
license=('custom')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'avahi' 'curl' 'libxml2')
source_x86_64=("https://audirvana.com/delivery/linux/apt-repo/pool/non-free/audirvana-studio/audirvana-studio_"$pkgver"_amd64.deb")
source_aarch64=("https://audirvana.com/delivery/linux/apt-repo/pool/non-free/audirvana-studio/audirvana-studio_"$pkgver"_arm64.deb")
source=('audirvanaStudio.service')
sha256sums=('c677a4e78cd0f752babe89943f85f3e7a915f4657e7529abfc0a95ab5e26b5bd')
sha256sums_x86_64=('5bcb2d89f2c2517a0ded715d51be3920f0d8e89517bb465bdbc417681c4fe3e0')
sha256sums_aarch64=('6bf9a1dc4cfd45f533645182f3eec373592b795048b3114b2662e417d7d85570')
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
