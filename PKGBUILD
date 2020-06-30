# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=borg-bin
pkgver=1.1.13
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
sha256sums=('f7fe86af86f15a4114b822666d12309ee63ed9b5dd1f696526c202c647bcce51')
sha256sums_x86_64=('60a662bef3669ed16bb29dadf6b59b74ff664f983d5fa71de7f1fb05a4fec7c0')
sha256sums_i686=('a4932a4bd94931137405533f86a744fea9c50cad0c6eb1b7220bb9d6098c6f9b')

package() {
    install -D $_tgt-$CARCH $pkgdir/usr/bin/borg
    ln $pkgdir/usr/bin/borg $pkgdir/usr/bin/borgfs
    install -D -m644 $_tgt-README.txt $pkgdir/usr/share/doc/$pkgname/README.txt
}

# vim:set ts=2 sw=2 et:
