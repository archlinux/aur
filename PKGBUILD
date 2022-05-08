# Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=hqplayer-pro
_debpkgver=4.21.0-34
pkgver=4.21.0
pkgrel=1
pkgdesc="Professional high-end audio file converter, recorder and player"
arch=('x86_64')
url="https://www.signalyst.com/professional.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'flac' 'libx11' 'gcc-libs' 'qt5-base' 'qt5-script' 'qt5-quickcontrols' 'qt5-charts' 'wavpack')
optdepends=('evince: hqplayer manual reading')
conflicts=('hqplayer-embedded' 'hqplayer-embedded-amd' 'hqplayer-embedded-rocm' 'hqplayer4')
source=("http://www.signalyst.com/bins/hqplayer4pro_"$_debpkgver"_amd64.deb")
sha256sums=('be2d25f1bb5bf71493661f5e1a4ad7cfe381d5b4927ba212ddca771737a6401d')

package() {
cd "$srcdir"
bsdtar xf data.tar.xz -C "$pkgdir"
rm -rf "$pkgdir/usr/share/doc-base"
install -Dm644 "$pkgdir/usr/share/doc/hqplayer4pro/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
rm -f "$pkgdir/usr/share/doc/hqplayer4pro/copyright"
install -d "$pkgdir"/usr/lib
install -Dm755 "$pkgdir"/opt/hqplayer4pro/lib/* "$pkgdir"/usr/lib/
rm -rf "$pkgdir/opt"
}
