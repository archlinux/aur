pkgname=micr0fetch
pkgver=0.3
pkgrel=1
epoch=
pkgdesc="Tool that pulls and displays system information"
arch=('x86_64')
url="https://github.com/MiraslauKavaliou/micr0fetch"
license=('MIT')
groups=()
depends=('glibc')
makedepends=('go')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/MiraslauKavaliou/micr0fetch/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
validpgpkeys=()

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go mod download
  go build -o micr0fetch .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 micr0fetch "$pkgdir/usr/bin/micr0fetch"
}

sha256sums=('4416ad71aeb2516287e03db2b5eefd65775ef593b1cae208352e364650eb25cc')
