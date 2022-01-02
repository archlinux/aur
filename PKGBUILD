# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=libabbaurora
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="A C++ library for the ABB Aurora protocol used by inverters and other devices" 
arch=('i686' 'x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://ahpohl.github.io/libabbaurora/"
license=('GPL3')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/libabbaurora.git#tag=v${pkgver}")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/doc/$pkgname/LICENSE
  install -Dm644 include/ABBAurora.h "$pkgdir"/usr/include/libabbaurora/ABBAurora.h
  install -Dm644 include/ABBAuroraEnums.h "$pkgdir"/usr/include/libabbaurora/ABBAuroraEnums.h
  install -Dm644 include/ABBAuroraSerial.h "$pkgdir"/usr/include/libabbaurora/ABBAuroraSerial.h
  install -Dm644 include/ABBAuroraStrings.h "$pkgdir"/usr/include/libabbaurora/ABBAuroraStrings.h
}
