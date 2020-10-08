# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=borg-arm-bin
pkgver=1.1.14
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
sha256sums=('9ef9eb76895bd4674a3dedcf191f0946eaf384d4bc8a6817c3c35a1df3452cee')
sha256sums_armv8h=('af9333bea23741c62b0461312c1dceed24d0818f4ebd1cfb456b85f887dc573a')
sha256sums_armv7h=('e5e75c45ae38c414e2655eeed2b91c11003061af09f4c13af4e109d5b8bfa5d9')
sha256sums_armv6h=('e5e75c45ae38c414e2655eeed2b91c11003061af09f4c13af4e109d5b8bfa5d9')
sha256sums_armv5h=('54bf7c75abe55bc52205042b390245c5e17d2785eb9a33c43e44bb51a2507199')

package() {
    install -D $_tgt-$CARCH $pkgdir/usr/bin/borg
    ln $pkgdir/usr/bin/borg $pkgdir/usr/bin/borgfs
    install -D -m644 $_tgt-README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
}

# vim:set ts=2 sw=2 et:
