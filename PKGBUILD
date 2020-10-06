# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=borg-bin
pkgver=1.1.14
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
sha256sums=('9ef9eb76895bd4674a3dedcf191f0946eaf384d4bc8a6817c3c35a1df3452cee')
sha256sums_x86_64=('372bd26e4259350493eb17f6e85ba859e36eed001b8b27f65dcae22ad9567edb')
sha256sums_i686=('1afce31267f656561b41b64d71f3382254f47409b8435c2f849922398d083d0b')

package() {
    install -D $_tgt-$CARCH $pkgdir/usr/bin/borg
    ln $pkgdir/usr/bin/borg $pkgdir/usr/bin/borgfs
    install -D -m644 $_tgt-README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
}

# vim:set ts=2 sw=2 et:
