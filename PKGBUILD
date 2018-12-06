# Maintainer: naxuroqa <naxuroqa@gmail.com>

pkgname=venom
_pkgname=Venom
pkgver=0.5.2
pkgrel=1
pkgdesc='a modern Tox client for the Linux desktop'
url='https://github.com/naxuroqa/venom'
arch=(x86_64)
license=('GPL3')
depends=('libgee' 'toxcore' 'gspell' 'xdg-desktop-portal' 'sqlcipher')
makedepends=('vala' 'meson')

source=("https://github.com/naxuroqa/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('9d52890104ced7889c5f49280cb69ba63331b55fc3ebbb68bd418e07cfc99db3799d6640cf8ddaf9a40e4bb079657cf8a7afd5bedd69ae4e392a5826819ba150')

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
