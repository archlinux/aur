# Maintainer: naxuroqa <naxuroqa@gmail.com>

pkgname=venom
_pkgname=Venom
pkgver=0.5.3
pkgrel=1
pkgdesc='a modern Tox client for the Linux desktop'
url='https://github.com/naxuroqa/venom'
arch=(x86_64)
license=('GPL3')
depends=('libgee' 'toxcore' 'gspell' 'xdg-desktop-portal' 'sqlcipher')
makedepends=('vala' 'meson')

source=("https://github.com/naxuroqa/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('3b1ada00b7f708dabb2ef2cc9f886c7df9e7a716e91c691639803675cd4adf3d53ff791ca92d3ff6daa6aeab859db251edca911e77962811ce6278c47995c4a5')

check() {
  ninja -C build test
}

build() {
  arch-meson $_pkgname-$pkgver build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
