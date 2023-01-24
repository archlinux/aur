# maintainer: Sergey A. <murlakatamenka@disroot.org> 
# ex-maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Contributor: Christopher Snowhill <chris@kode54.net>
# Contributor: Denis Zheleztsov <difrex.punk@gmail.com>

pkgname=wlr-randr
pkgver=0.3.0
pkgrel=1
pkgdesc='Utility to manage outputs of a Wayland compositor'
arch=('x86_64')
url='https://sr.ht/~emersion/wlr-randr/'
license=('MIT')
depends=('wayland')
makedepends=('meson')
source=("https://git.sr.ht/~emersion/wlr-randr/refs/download/v$pkgver/wlr-randr-$pkgver.tar.gz"{,.sig})
sha256sums=('1796008aa2ff272803f008cf71c4336553a4e48f519c76b0c65ab169ad71cdad'
            'SKIP')
validpgpkeys=('34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48')

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
