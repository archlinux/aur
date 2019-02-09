# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>
pkgname=gofish-packages
pkgver=0.10.0
pkgrel=1
pkgdesc="Crossplatform package manager"
arch=('any')
url="https://gofi.sh/index.html"
license=('Apache')
ARCH=$(uname -m)
case $CARCH in
    armv5*) ARCH="armv5";;
    armv6*) ARCH="armv6";;
    armv7*) ARCH="armv7";;
    aarch64) ARCH="arm64";;
    x86) ARCH="386";;
    x86_64) ARCH="amd64";;
    i686) ARCH="386";;
    i386) ARCH="386";;
esac
source=("https://gofi.sh/releases/gofish-v$pkgver-linux-$ARCH.tar.gz"
)
md5sums=('253b8d83c664d6764a5a4493e07d9c0e'
)
package() {
    install -Dm755 "$srcdir/linux-$ARCH/gofish" "$pkgdir/usr/local/bin/gofish"
    install -Dm644 "$srcdir/linux-$ARCH/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:

