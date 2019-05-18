# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=borg-arm-bin
pkgver=1.1.10
pkgrel=1
pkgdesc="Borg backup - prebuilt standalone ARM binary"
url="https://borgbackup.readthedocs.io/en/stable/installation.html#standalone-binary"
license=("BSD")
arch=("armv6h" "armv7h" "armv8h")
provides=("borg" "borgbackup")
conflicts=("borg" "borgbackup" "borg-bin")
_tgt="$pkgname-$pkgver"
_baseurl="https://github.com/borgbackup/borg/releases/download"
_armurl="https://dl.bintray.com/borg-binary-builder/borg-binaries"
source=("$_tgt-README.txt::$_baseurl/$pkgver/README.txt")
source_armv6h=("$_tgt-armv6h::$_armurl/borg-$pkgver-armv6")
source_armv7h=("$_tgt-armv7h::$_armurl/borg-$pkgver-armv6")
source_armv8h=("$_tgt-armv8h::$_armurl/borg-$pkgver-arm64")
sha256sums=('e694697cd7b7ccc6330ab16eb91046150f5950ecb0598e125cadaac0ebd4dada')
sha256sums_armv6h=('05d8dad1d1ac03d41c5848dfa0cf095c0344ca0a280058498583543f257aa731')
sha256sums_armv7h=('05d8dad1d1ac03d41c5848dfa0cf095c0344ca0a280058498583543f257aa731')
sha256sums_armv8h=('feef734f3c07e2f1a2850493652ec289fa2731aa2cd9b292fa92741bc915cbbd')

package() {
    install -D $_tgt-$CARCH $pkgdir/usr/bin/borg
    ln $pkgdir/usr/bin/borg $pkgdir/usr/bin/borgfs
    install -D -m644 $_tgt-README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
}

# vim:set ts=2 sw=2 et:
