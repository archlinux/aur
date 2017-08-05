# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=highlight-wookietreiber
_pkgname=highlight
pkgver=0.0.1
pkgrel=1
pkgdesc="searches for a pattern or regular expression (regex) and highlights matches"
arch=('i686' 'x86_64')
url="https://github.com/wookietreiber/highlight"
license=('GPL')
depends=('gc' 'libunwind' 're2')
makedepends=('clang' 'sbt')
conflicts=('hl-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wookietreiber/highlight/archive/v$pkgver.tar.gz")
md5sums=('949b0e87e544819bfebf01d24d12dec3')

package() {
  cd $srcdir/$_pkgname-$pkgver

  PREFIX=$pkgdir/usr sbt \
    -ivy /tmp/makepkg-sbt-highlight/ivy2 \
    -sbt-dir /tmp/makepkg-sbt-highlight/sbt \
    install
}
