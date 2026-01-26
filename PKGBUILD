# Maintainer: Mateusz Galazyn <carbolymer at gmail.com>
# Maintainer: Marcin Rzeźnicki <marcin.rzeznicki@gmail.com>

pkgname=haskell-language-server-static
pkgver=2.13.0.0
pkgrel=1
pkgdesc="Official haskell ide support via language server (LSP). Successor of ghcide & haskell-ide-engine."
arch=('x86_64')
url="https://github.com/haskell/${pkgname%-static}"
license=('Apache')
depends=('sh' 'zlib' 'gmp')
provides=('haskell-language-server')
conflicts=('haskell-language-server' 'haskell-language-server-git')
source=("https://downloads.haskell.org/~hls/haskell-language-server-${pkgver}/haskell-language-server-${pkgver}-${arch}-linux-unknown.tar.xz")
sha256sums=('668fc1537ea6c209ae061ae35cf924937293a88e829e1a61dbbdcea668e49ec1')
options=(!strip)

package() {
  cd "${srcdir}/haskell-language-server-${pkgver}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

