# Contributor: kusakata <shohei atmark kusakata period com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ttf2woff
pkgver=1.2
pkgrel=2
pkgdesc='Command line utility converts TrueType and OpenType fonts to the WOFF format.'
arch=('i686' 'x86_64')
url="https://github.com/doio/ttf2woff"
license=('GPL')
depends=('zlib')
source=("https://github.com/doio/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('e1f3b24e54d34699e48278e39613a1b0')
sha1sums=('53431e58ce65c610f3ed01a1818466a236d5538c')
sha256sums=('9f929f1ec02ca36f00fdb805bcc931de4994439f3f639390eaee59cf2bb2a58e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  make BINDIR="$pkgdir/usr/bin" install
}

