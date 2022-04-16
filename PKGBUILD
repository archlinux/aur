# Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=hqplayer-pro
_debpkgver=4.20.0-33
pkgver=4.20.0
pkgrel=1
pkgdesc="Professional high-end audio file converter, recorder and player"
arch=('x86_64')
url="https://www.signalyst.com/professional.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'flac' 'libx11' 'gcc-libs' 'qt5-base' 'qt5-script' 'qt5-quickcontrols' 'qt5-charts' 'wavpack')
optdepends=('evince: hqplayer manual reading')
source=("http://www.signalyst.com/bins/hqplayer4pro_"$_debpkgver"_amd64.deb")
sha256sums=('61814cd907a3f550fdd0f2ebaca074d0a0f1a5d1d485c1bc85af8035d7ed397a')

package() {
cd "$srcdir"
bsdtar xf data.tar.xz -C "$pkgdir"
rm -rf "$pkgdir/usr/share/doc-base"
install -Dm644 "$pkgdir/usr/share/doc/hqplayer4pro/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
rm -f "$pkgdir/usr/share/doc/hqplayer4pro/copyright"
install -Dm755 "$pkgdir/opt/hqplayer4pro/lib/libsgllnx64-2.29.02.so" "$pkgdir/usr/lib/hqplayer-pro/libsgllnx64-2.29.02.so"
rm -rf "$pkgdir/opt"
}
