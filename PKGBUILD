# Maintainer: wilke
pkgname=harsh-bin
pkgver=0.9.1
pkgrel=0
pkgdesc="CLI habit tracking for geeks"
arch=('any')
url="https://github.com/wakatara/harsh"
license=('MIT')

provides=('harsh')
conflicts=('harsh')

case "$CARCH" in
    x86_64) _pkgarch="x86_64"
	sha256sums=('f80cd8e525e4c1a072e372a67149e64509b1ba7079a1faa947b0bf97e73f2010')
           ;;
    armv64h) _pkgarch="arm64"
	sha256sums=('fb1f56a6280e6ba0bda0b94ef8895c325d5c4b1b7dd6f55632ca69b939eca0b3')
           ;;
    i686) _pkgarch="i386"
	sha256sums=('9a7b96eaab591602f610a801014653f0452a5dd5ebb16f6e7b531f36be0ebe91')
           ;;
esac

source=("$pkgname-$pkgver.tgz::https://github.com/wakatara/harsh/releases/download/v$pkgver/harsh_Linux_$_pkgarch.tar.gz")

package() {
    install -Dm755 harsh -t"$pkgdir/usr/bin/"
}
