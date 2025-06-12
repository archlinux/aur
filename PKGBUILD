# Maintainer: Mateusz Galazyn <carbolymer at gmail.com>
# Maintainer: Marcin Rzeźnicki <marcin.rzeznicki@gmail.com>

pkgname=haskell-language-server-static
pkgver=2.11.0.0
pkgrel=1
pkgdesc="Official haskell ide support via language server (LSP). Successor of ghcide & haskell-ide-engine."
arch=('x86_64')
url="https://github.com/haskell/${pkgname%-static}"
license=('Apache')
depends=('sh' 'zlib' 'gmp')
provides=('haskell-language-server')
conflicts=('haskell-language-server' 'haskell-language-server-git')
source=("https://downloads.haskell.org/~hls/haskell-language-server-${pkgver}/haskell-language-server-${pkgver}-${arch}-linux-unknown.tar.xz")
sha256sums=('f82af0d923d19a4b7c9419da9015a942de6705e8ccc13a8ca6b03a050af84753')
options=(!strip)

package() {
  cd "${srcdir}/haskell-language-server-${pkgver}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

