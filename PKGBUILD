# Maintainer: linkfrg <linkfrg.dev@proton.me>
pkgname=ignis-gvc
pkgver=0.1.0
pkgrel=1
pkgdesc="A standalone libgvc for Ignis"
arch=('x86_64')
url="https://github.com/ignis-sh/ignis-gvc"
license=('MIT')
makedepends=(gobject-introspection
             meson
             )
depends=(glib2
         glib2-devel
         libpulse
         )

source=("git+${url}")
sha256sums=('SKIP')
provides=('ignis-gvc')
conflicts=('ignis-gvc-git')
source=("$pkgname-v$pkgver.tar.gz::$url/releases/download/v${pkgver}/ignis-gvc-v${pkgver}.tar.gz")
sha256sums=('a6421c00f227c0f041ca07a0fc0933a20b6fc8b449265a47ca887c456b0d3c96')

build() {
  cd $srcdir/$pkgname
  arch-meson build
  meson compile -C build
}

package() {
  cd $srcdir/$pkgname
  meson install -C build --destdir "$pkgdir"
}
