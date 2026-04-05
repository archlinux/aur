# Maintainer: earch <earch.oer1k at aleeas dot com>
pkgname=fnf-git
pkgver=r375.01a6ca1
pkgrel=1
pkgdesc="An interactive fuzzy finder for the terminal (git)"
arch=('x86_64')
url="https://github.com/leo-arch/fnf"
license=('MIT')
depends=('glibc')
makedepends=('git')
optdepends=('clifm: to use with clifm (--tabmode=fnf)')
provides=('fnf')
conflicts=('fnf')
source=("${pkgname}::git+https://github.com/leo-arch/fnf.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make PREFIX="$pkgdir/usr" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
