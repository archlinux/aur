# Maintainer: naxuroqa <naxuroqa@gmail.com>

pkgname=venom
_pkgname=Venom
pkgver=0.4.0
pkgrel=1
pkgdesc='a modern Tox client for the Linux desktop'
url='https://github.com/naxuroqa/venom'
arch=(x86_64)
license=('GPL3')
depends=('gtk3' 'libgee' 'toxcore')
makedepends=('vala' 'meson')

source=("https://github.com/naxuroqa/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('3401f80aef8d4b94cceaf80297aee12b80d143f86d16f0e36f359d33a5c00cfffe2984b9f242b4a922844921b3386d5fed50e85e51064c04dee716cd7e43dbe7')

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
