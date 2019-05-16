# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=borg-arm-bin
pkgver=1.1.9
pkgrel=1
pkgdesc="Borg backup - prebuilt standalone ARM binary"
url="https://borgbackup.readthedocs.io/en/stable/installation.html#standalone-binary"
license=("BSD")
arch=("armv6h" "armv7h" "armv8h")
provides=("borg" "borgbackup")
conflicts=("borg" "borgbackup")
_tgt="$pkgname-$pkgver"
_baseurl="https://github.com/borgbackup/borg/releases/download"
_armurl="https://dl.bintray.com/borg-binary-builder/borg-binaries"
source=("$_tgt-README.txt::$_baseurl/$pkgver/README.txt")
source_armv6h=("$_tgt-armv6h::$_armurl/borg-$pkgver-armv6")
source_armv7h=("$_tgt-armv7h::$_armurl/borg-$pkgver-armv6")
source_armv8h=("$_tgt-armv8h::$_armurl/borg-$pkgver-arm64")
sha256sums=('c062f7f55caf4aed6579d350bbe777668b6d690382aa5b300eec91bb1aa6e719')
sha256sums_armv6h=('50d2179e0e1358bfd2e9fb239f0f6ab6f4acf8715ac1ebabc052e59f3a9ae06e')
sha256sums_armv7h=('50d2179e0e1358bfd2e9fb239f0f6ab6f4acf8715ac1ebabc052e59f3a9ae06e')
sha256sums_armv8h=('49207b45caaa7a303c18f964932103687030167d33607c84fa263e5820d606b9')

package() {
    install -D $_tgt-$CARCH $pkgdir/usr/bin/borg
    ln $pkgdir/usr/bin/borg $pkgdir/usr/bin/borgfs
    install -D -m644 $_tgt-README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
}

# vim:set ts=2 sw=2 et:
