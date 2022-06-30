# Maintainer: Jakub Szczerbiński <jszczerbinsky2@gmail.com>
pkgname=ptsh
pkgver=0.4
pkgrel=1
pkgdesc="Visually customizable shell utils"
arch=('any')
url="https://github.com/jszczerbinsky/ptSh"
license=('MIT')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/jszczerbinsky/ptSh/archive/refs/tags/v${pkgver//_/-}.tar.gz")
noextract=()
sha256sums=('7c37a88056d6270b25b79db07c6a3828fefd42c8b57660f9b6a1f65b0d76c5bf')

build() {
  cd "ptSh-${pkgver//_/-}"
  make
}

package() {
	mkdir -p "$pkgdir/usr"
  cd "ptSh-${pkgver//_/-}"
  make DESTDIR="$pkgdir/" install
	echo "Version: v$pkgver" > "$pkgdir/usr/share/ptSh/version.txt"
}
