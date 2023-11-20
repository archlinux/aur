# Maintainer: Mateusz Galazyn <carbolymer at gmail.com>
# Maintainer: Marcin Rzeźnicki <marcin.rzeznicki@gmail.com>

pkgname=haskell-language-server-static
pkgver=2.4.0.0
pkgrel=1
pkgdesc="Official haskell ide support via language server (LSP). Successor of ghcide & haskell-ide-engine."
arch=('x86_64')
url="https://github.com/haskell/${pkgname%-static}"
license=('Apache')
depends=('sh' 'zlib' 'gmp')
provides=('haskell-language-server')
conflicts=('haskell-language-server' 'haskell-language-server-git')
source=("https://downloads.haskell.org/~hls/haskell-language-server-${pkgver}/haskell-language-server-${pkgver}-${arch}-linux-fedora33.tar.xz")
sha256sums=('03330ed40f733d985a51abab3640d3dc887186c0c5a12823689c844dc25322f2')
options=(!strip)

package() {
  cd "${srcdir}/haskell-language-server-${pkgver}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

