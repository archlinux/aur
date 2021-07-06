# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=borg-bin
pkgver=1.1.16
pkgrel=2
pkgdesc="Borg backup - prebuilt standalone binary"
url="https://borgbackup.readthedocs.io/en/stable/installation.html#standalone-binary"
license=("BSD")
arch=("x86_64" "i686")
provides=("borg" "borgbackup")
conflicts=("borg" "borgbackup" "borg-arm-bin")
_tgt="$pkgname-$pkgver"
_baseurl="https://github.com/borgbackup/borg/releases/download"
source=("$_tgt-README.txt::$_baseurl/$pkgver/README.txt")
source_x86_64=("$_tgt-x86_64::$_baseurl/$pkgver/borg-linux64")
sha256sums=('679b54d5967b16cf8be8e89ad34354de7389431e08b904afbe305acb6fb2aa81')
sha256sums_x86_64=('fe1caaeee9354ead27379b8235a92eb1885d7948126d2edd49e60a2b85d4bcee')

package() {
    install -D $_tgt-$CARCH $pkgdir/usr/bin/borg
    ln $pkgdir/usr/bin/borg $pkgdir/usr/bin/borgfs
    install -D -m644 $_tgt-README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
}

# vim:set ts=2 sw=2 et:
