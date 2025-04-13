# Maintainer: Raiku <rikunn.rikunn@proton.me>
pkgname=sam-rewritten
pkgver=1.0
pkgrel=2
url="https://github.com/gitRaiku/sam"
pkgdesc="Software automatic mouth rewritten to use dynamically allocated memory"
arch=(any)
license=('GPL-3.0')
depends=('sdl12-compat')
makedepends=('make')
source=("https://github.com/gitRaiku/sam/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f6333d5c75f9949317ba9fd0f0d2398dd57a03f7b2fd81a1069c74e17c570628')

build() {
  cd $srcdir/SAM-$pkgver
  make
}

package() {
  cd "SAM-$pkgver"
  install -Dm 0755 sam -t "$pkgdir/usr/bin"
}
