# Maintainer: Mateusz Galazyn <carbolymer at gmail.com>
# Maintainer: Marcin Rzeźnicki <marcin.rzeznicki@gmail.com>

pkgname=haskell-language-server-static
pkgver=1.9.0.0
pkgrel=1
pkgdesc="Official haskell ide support via language server (LSP). Successor of ghcide & haskell-ide-engine."
arch=('x86_64')
url="https://github.com/haskell/${pkgname%-static}"
license=('Apache')
depends=('sh' 'zlib' 'gmp')
provides=('haskell-language-server')
conflicts=('haskell-language-server' 'haskell-language-server-git')
source=("https://downloads.haskell.org/~hls/haskell-language-server-${pkgver}/haskell-language-server-${pkgver}-${arch}-linux-fedora33.tar.xz")
sha256sums=('bd6b5d596992d09c5380975f29a28f6591109e90dd7f3e63a8c93c90579e2964')
options=(!strip)

package() {
  cd "${srcdir}/haskell-language-server-${pkgver}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

