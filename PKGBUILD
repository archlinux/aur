# Maintainer: countzero <?>
pkgname="rwc"
pkgver=r21.80fee50
pkgrel=1
pkgdesc="Analog of wc(1) written on Rust programming language."
arch=("x86_64")
url="https://codeberg.org/_void/rwc"
license=('MIT')
depends=('rust')
makedepends=('git')
source=("${pkgname}::git+https://codeberg.org/_void/rwc.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
	install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
}
