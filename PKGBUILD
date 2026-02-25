# Maintainer: Dainz <mbenjaminarancibia@gmail.com>
pkgname='etali'
pkgver=v1.0.0.r0.g64006c0
pkgrel=1
pkgdesc="A simple CLI tool for the Scryfall API."
arch=('x86_64')
url="https://github.com/xdainz/Etali"
options=('!debug' 'strip')
license=('MIT')
depends=('jsoncpp' 'curl' 'gcc-libs' 'glibc')
makedepends=('git')
source=("etali::git+https://github.com/xdainz/Etali.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
  install -Dm755 ./etali "$pkgdir/usr/bin/etali"
  install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
