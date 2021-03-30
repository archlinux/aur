# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=borg-arm-bin
pkgver=1.1.16
pkgrel=1
pkgdesc="Borg backup - prebuilt standalone ARM binary"
url="https://borgbackup.readthedocs.io/en/stable/installation.html#standalone-binary"
license=("BSD")
arch=("armv8h" "armv7h" "armv6h" "armv5h")
provides=("borg" "borgbackup")
conflicts=("borg" "borgbackup" "borg-bin")
_tgt="$pkgname-$pkgver"
_baseurl="https://github.com/borgbackup/borg/releases/download"
_armurl="https://borg.bauerj.eu/bin"
source=("$_tgt-README.txt::$_baseurl/$pkgver/README.txt")
source_armv8h=("$_tgt-armv8h::$_armurl/borg-$pkgver-arm64")
source_armv7h=("$_tgt-armv7h::$_armurl/borg-$pkgver-armv6")
source_armv6h=("$_tgt-armv6h::$_armurl/borg-$pkgver-armv6")
source_armv5h=("$_tgt-armv5h::$_armurl/borg-$pkgver-armv5")
sha256sums=('679b54d5967b16cf8be8e89ad34354de7389431e08b904afbe305acb6fb2aa81')
sha256sums_armv8h=('9b1f60c38e8903bcb7d1a0c852b80c3d998c8349b24ee764cd560c89ffba4c95')
sha256sums_armv7h=('a36f742d5feefef3714e429bfc8c9130746cf34c6cf7a5792a7006cd70c63446')
sha256sums_armv6h=('a36f742d5feefef3714e429bfc8c9130746cf34c6cf7a5792a7006cd70c63446')
sha256sums_armv5h=('cb27137142addbeadb14ddefff1b90ce053dc64de1b0881a8dba245141b8e8bb')

package() {
    install -D $_tgt-$CARCH $pkgdir/usr/bin/borg
    ln $pkgdir/usr/bin/borg $pkgdir/usr/bin/borgfs
    install -D -m644 $_tgt-README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
}

# vim:set ts=2 sw=2 et:
