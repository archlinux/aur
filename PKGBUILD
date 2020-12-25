# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=borg-bin
pkgver=1.1.15
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
sha256sums=('6ce91f29942fddbfa914a4f0b541984a2cbfde155120ec9139b559aaa2e08407')
sha256sums_x86_64=('9e87a2b19a6d1034abedf3265bbf5f063238246fc56e6087b6ec4a21f29b4239')

package() {
    install -D $_tgt-$CARCH $pkgdir/usr/bin/borg
    ln $pkgdir/usr/bin/borg $pkgdir/usr/bin/borgfs
    install -D -m644 $_tgt-README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
}

# vim:set ts=2 sw=2 et:
