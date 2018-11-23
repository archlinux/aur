# Maintainer: naxuroqa <naxuroqa@gmail.com>

pkgname=venom
_pkgname=Venom
pkgver=0.5.1
pkgrel=1
pkgdesc='a modern Tox client for the Linux desktop'
url='https://github.com/naxuroqa/venom'
arch=(x86_64)
license=('GPL3')
depends=('libgee' 'toxcore' 'gspell' 'xdg-desktop-portal' 'sqlcipher')
makedepends=('vala' 'meson')

source=("https://github.com/naxuroqa/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('4426d9a2290d650590f23f54dc5afa77b3456d8d61a8a2409ea4c340818b151cc0e25d87f76ded6a0a0b6c873a1981433290eed97004273e85c9101fe0c5d55e')

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
