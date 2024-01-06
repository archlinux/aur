# Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=hqplayer-pro
_debpkgver=4.22.2-37
pkgver=4.22.2
pkgrel=1
pkgdesc="Professional high-end audio file converter, recorder and player"
arch=('x86_64')
url="https://www.signalyst.com/professional.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'flac' 'libx11' 'gcc-libs' 'qt5-base' 'qt5-script' 'qt5-quickcontrols' 'qt5-charts' 'wavpack')
optdepends=('evince: hqplayer manual reading')
conflicts=('hqplayer-embedded' 'hqplayer-embedded-amd' 'hqplayer-embedded-rocm' 'hqplayer4')
source=("http://www.signalyst.com/bins/hqplayer4pro_"$_debpkgver"_amd64.deb")
sha256sums=('baabde760d9d72fd56c8558265aba5acd97122712ec650f0a93ac13d63428ce9')
install=${pkgname}.install

package() {
cd "$srcdir"
bsdtar xf data.tar.zst -C "$pkgdir"
rm -rf "$pkgdir/usr/share/doc-base"
install -Dm644 "$pkgdir/usr/share/doc/hqplayer4pro/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
rm -f "$pkgdir/usr/share/doc/hqplayer4pro/copyright"
install -d "$pkgdir"/usr/lib
install -Dm755 "$pkgdir"/opt/hqplayer4pro/lib/* "$pkgdir"/usr/lib/
rm -rf "$pkgdir/opt"
}
