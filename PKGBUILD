# Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=hqplayer-pro
_debpkgver=4.18.2-30
pkgver=4.18.2
pkgrel=1
pkgdesc="Professional high-end audio file converter, recorder and player"
arch=('x86_64')
url="https://www.signalyst.com/professional.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'flac' 'libx11' 'gcc-libs' 'qt5-base' 'qt5-script' 'qt5-quickcontrols' 'qt5-charts' 'wavpack')
optdepends=('evince: hqplayer manual reading')
source=("http://www.signalyst.com/bins/hqplayer4pro_"$_debpkgver"_amd64.deb")
sha256sums=('a50a85aa7818a67da5e4d2514149ba471f78cb81645fa2dfda66ab1d903b54da')

package() {
 cd "$srcdir"
 bsdtar xf data.tar.xz -C "$pkgdir"
 rm -rf "$pkgdir/usr/share/doc-base"
 install -Dm644 "$pkgdir/usr/share/doc/hqplayer4pro/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
 rm -f "$pkgdir/usr/share/doc/hqplayer4pro/copyright"
}
