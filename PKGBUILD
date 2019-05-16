# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=borg-bin
pkgver=1.1.10
pkgrel=1
pkgdesc="Borg backup - prebuilt standalone binary"
url="https://borgbackup.readthedocs.io/en/stable/installation.html#standalone-binary"
license=("BSD")
arch=("x86_64" "i686")
provides=("borg" "borgbackup")
conflicts=("borg" "borgbackup")
_tgt="$pkgname-$pkgver"
_baseurl="https://github.com/borgbackup/borg/releases/download"
source=("$_tgt-README.txt::$_baseurl/$pkgver/README.txt")
source_x86_64=("$_tgt-x86_64::$_baseurl/$pkgver/borg-linux64")
source_i686=("$_tgt-i686::$_baseurl/$pkgver/borg-linux32")
sha256sums=('e694697cd7b7ccc6330ab16eb91046150f5950ecb0598e125cadaac0ebd4dada')
sha256sums_x86_64=('6338d67aad4b5cd327b25ea363e30f0ed4abc425ce2d6a597c75a67a876ef9af')
sha256sums_i686=('a55d3c85d45bf4965476a542e11731457621d39031f55f104f389277ec950187')

package() {
    install -D $_tgt-$CARCH $pkgdir/usr/bin/borg
    ln $pkgdir/usr/bin/borg $pkgdir/usr/bin/borgfs
    install -D -m644 $_tgt-README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
}

# vim:set ts=2 sw=2 et:
