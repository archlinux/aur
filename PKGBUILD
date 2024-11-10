# Maintainer: Alexander Pohl <alex at ahpohl dot com>
pkgname=libsunspec
pkgver=0.1.6
pkgrel=2
epoch=
pkgdesc="A C++ library for SunSpec compatible inverters, meters and batteries" 
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://ahpohl.github.io/libsunspec/"
license=('GPL3')
groups=()
depends=('libmodbus>=3.1.11')
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
source=("$pkgname-$pkgver::git+https://github.com/ahpohl/libsunspec.git#tag=v${pkgver}")
noextract=()
sha256sums=('b0f8d180eb22aec63b534a7b9d10aae0947436b616b71f4f23d210d5e70c791b')
validpgpkeys=()

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
  install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/$pkgname/CHANGELOG.md
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
