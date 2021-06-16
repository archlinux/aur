# Maintainer: Daniil "danogentili" Gentili <daniil@daniil.it>
pkgname=plotframes
pkgver=2.0.2
pkgrel=2
pkgdesc="A Node.js frame plotter inspired by FFmpeg plotframes"
arch=(any)
url="https://github.com/rodrigopolo/plotframes"
license=('MIT')
depends=('nodejs' 'gnuplot')
makedepends=('npm')

source=("https://github.com/danog/plotframes/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('aa8e6aeb1f86524ba6202bfaa788f97bbffe23f6ea448eeffe7ed8808aa62e0d11f346ff89605a1f13003042f63aa971c79c723afb6550ae4c5a618b569c1c67')
noextract=("v${pkgver}.tgz")

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" "$srcdir/v${pkgver}.tar.gz"
}
