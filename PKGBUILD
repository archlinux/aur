# Maintainer: Mateusz Galazyn <carbolymer at gmail.com>
# Maintainer: Marcin Rzeźnicki <marcin.rzeznicki@gmail.com>

pkgname=haskell-language-server-static
pkgver=2.0.0.1
pkgrel=1
pkgdesc="Official haskell ide support via language server (LSP). Successor of ghcide & haskell-ide-engine."
arch=('x86_64')
url="https://github.com/haskell/${pkgname%-static}"
license=('Apache')
depends=('sh' 'zlib' 'gmp')
provides=('haskell-language-server')
conflicts=('haskell-language-server' 'haskell-language-server-git')
source=("https://downloads.haskell.org/~hls/haskell-language-server-${pkgver}/haskell-language-server-${pkgver}-${arch}-linux-fedora33.tar.xz")
sha256sums=('cf872e7efe250f0f40ce517c1f7486812abc9168822499a105fdd7737862188e')
options=(!strip)

package() {
  cd "${srcdir}/haskell-language-server-${pkgver}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

