# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=borg-arm-bin
pkgver=1.1.15
pkgrel=1
pkgdesc="Borg backup - prebuilt standalone ARM binary"
url="https://borgbackup.readthedocs.io/en/stable/installation.html#standalone-binary"
license=("BSD")
arch=("armv8h" "armv7h" "armv6h" "armv5h")
provides=("borg" "borgbackup")
conflicts=("borg" "borgbackup" "borg-bin")
_tgt="$pkgname-$pkgver"
_baseurl="https://github.com/borgbackup/borg/releases/download"
_armurl="https://dl.bintray.com/borg-binary-builder/borg-binaries"
source=("$_tgt-README.txt::$_baseurl/$pkgver/README.txt")
source_armv8h=("$_tgt-armv8h::$_armurl/borg-$pkgver-arm64")
source_armv7h=("$_tgt-armv7h::$_armurl/borg-$pkgver-armv6")
source_armv6h=("$_tgt-armv6h::$_armurl/borg-$pkgver-armv6")
source_armv5h=("$_tgt-armv5h::$_armurl/borg-$pkgver-armv5")
sha256sums=('6ce91f29942fddbfa914a4f0b541984a2cbfde155120ec9139b559aaa2e08407')
sha256sums_armv8h=('452117572fac376f6a2e963a82ef6f591c7aa90bf0ad0b97c3e56166f4a1d1ca')
sha256sums_armv7h=('08107532ff74a730251c20fc87974f79e4476b049b2571bc029bd987ef127490')
sha256sums_armv6h=('08107532ff74a730251c20fc87974f79e4476b049b2571bc029bd987ef127490')
sha256sums_armv5h=('a5f4574b9ec0de9bc877907c3c4b1026428a457d204bdf69dc2825a616c4072c')

package() {
    install -D $_tgt-$CARCH $pkgdir/usr/bin/borg
    ln $pkgdir/usr/bin/borg $pkgdir/usr/bin/borgfs
    install -D -m644 $_tgt-README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
}

# vim:set ts=2 sw=2 et:
