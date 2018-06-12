# Maintainer: naxuroqa <naxuroqa@gmail.com>

pkgname=venom
_pkgname=Venom
pkgver=0.3.0
pkgrel=1
pkgdesc='a modern Tox client for the Linux desktop'
url='https://github.com/naxuroqa/venom'
arch=(x86_64)
license=('GPL3')
depends=('gtk3' 'libgee' 'toxcore')
makedepends=('vala' 'meson')

source=("https://github.com/naxuroqa/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('8c87db50bc392d571303d69ca3f655c813f27e89dd6ce0d542f8d72277c2fece4d72fece0c22a448a36c52983400d8aaf34da33745cddcd8cbfebd8526879bdc')

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
