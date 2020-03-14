# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=borg-bin
pkgver=1.1.11
pkgrel=1
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
source_i686=("$_tgt-i686::$_baseurl/$pkgver/borg-linux32")
sha256sums=('5ccff5fa1ba183447a9de47cba6cea95bb25905ebd39edc30371cac761ffaf12')
sha256sums_x86_64=('7848d1788b5d7f2ae99a599a87992cab4f01584fe5eb393819fceaecf076433b')
sha256sums_i686=('3626501dc9715324c70a20b5140a8993b70f0f8530066ab18fb8b75eb4250a72')

package() {
    install -D $_tgt-$CARCH $pkgdir/usr/bin/borg
    ln $pkgdir/usr/bin/borg $pkgdir/usr/bin/borgfs
    install -D -m644 $_tgt-README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
}

# vim:set ts=2 sw=2 et:
