# Maintainer: Your Name <youremail@domain.com>
pkgname=obliviate
pkgver=2.1.0
pkgrel=1
pkgdesc="A password manager that forgets your passwords"
arch=('x86_64')
url="https://github.com/elfenware/obliviate"
license=('GPL3')
depends=('glib2' 'granite' 'gtk3' 'libgcrypt')
makedepends=('meson' 'vala')
source=(${url}/archive/v$pkgver.tar.gz)
sha512sums=('093bf5a1e8e6bc1d51c0f157b1eb73cf9aa2d9a49e1ae31c179719c448fbd774153f2dda09443d9737ad47d040e336945b7b33998055d31ea3abd9d0ce3bebe6')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
