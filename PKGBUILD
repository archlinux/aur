# maintainer: Sergey A. <murlakatamenka@disroot.org>
# ex-maintainer: Robert Cegliński <rob.ceglinski@gmail.com>
# Contributor: Christopher Snowhill <chris@kode54.net>
# Contributor: Denis Zheleztsov <difrex.punk@gmail.com>

pkgname=wlr-randr
pkgver=0.3.1
pkgrel=1
pkgdesc='Utility to manage outputs of a Wayland compositor'
arch=('x86_64')
url='https://sr.ht/~emersion/wlr-randr/'
license=('MIT')
depends=('wayland')
makedepends=('meson')
source=("https://git.sr.ht/~emersion/wlr-randr/refs/download/v$pkgver/wlr-randr-$pkgver.tar.gz"{,.sig})
sha256sums=('37ef025da9653d327bc7bb46c34294171d64749f5e12a3d08d124a2e81b4a089'
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
