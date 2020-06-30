# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=borg-arm-bin
pkgver=1.1.13
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
sha256sums=('f7fe86af86f15a4114b822666d12309ee63ed9b5dd1f696526c202c647bcce51')
sha256sums_armv8h=('d942f2815cc6b8acbd6c0f08920160a6e850d9dbb84178af8b72f4eb9e5f9cae')
sha256sums_armv7h=('7724c7adcc412465d9a3a8a5a8b1ce69af21e01bac92fe15e07a3d44aae16bea')
sha256sums_armv6h=('7724c7adcc412465d9a3a8a5a8b1ce69af21e01bac92fe15e07a3d44aae16bea')
sha256sums_armv5h=('925a50349edb8ceea002c95d68ea4c6771b78bc4743d32aed4668ecacca54e48')

package() {
    install -D $_tgt-$CARCH $pkgdir/usr/bin/borg
    ln $pkgdir/usr/bin/borg $pkgdir/usr/bin/borgfs
    install -D -m644 $_tgt-README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
}

# vim:set ts=2 sw=2 et:
