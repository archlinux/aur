# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=highlight-wookietreiber
_pkgname=highlight
pkgver=0.1.0
pkgrel=1
pkgdesc="searches for a pattern or regular expression (regex) and highlights matches"
arch=('i686' 'x86_64')
url="https://github.com/wookietreiber/highlight"
license=('GPL')
depends=('gc' 'libunwind' 're2')
makedepends=('clang' 'sbt')
conflicts=('hl-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wookietreiber/highlight/archive/v$pkgver.tar.gz")
md5sums=('b343c77d81b7ce5cb3a357def07a1291')

package() {
  cd $srcdir/$_pkgname-$pkgver

  echo 'nativeMode := "release"' > aur.sbt

  PREFIX=$pkgdir/usr sbt \
    -ivy /tmp/makepkg-sbt-highlight/ivy2 \
    -sbt-dir /tmp/makepkg-sbt-highlight/sbt \
    install
}
