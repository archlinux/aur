# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=borg-arm-bin
pkgver=1.1.11
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
sha256sums=('5ccff5fa1ba183447a9de47cba6cea95bb25905ebd39edc30371cac761ffaf12')
sha256sums_armv8h=('fd6198503312f584506454414530b540fa0f48bd615d2306a9d868da979c7ca0')
sha256sums_armv7h=('40d2465c10b7c49a5c26117f2698bdc98a44ac5c5c79abe937d4b69a83fd8cf9')
sha256sums_armv6h=('40d2465c10b7c49a5c26117f2698bdc98a44ac5c5c79abe937d4b69a83fd8cf9')
sha256sums_armv5h=('3344cb088309635343a11a2f9092c801b6d1be84c594534ec6258fd45313417a')

package() {
    install -D $_tgt-$CARCH $pkgdir/usr/bin/borg
    ln $pkgdir/usr/bin/borg $pkgdir/usr/bin/borgfs
    install -D -m644 $_tgt-README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
}

# vim:set ts=2 sw=2 et:
