# Maintainer: apreiml <apreiml@strohwolke.at>
pkgname=hare-ssh-git
_pkgname=${pkgname%-git}
pkgver=r95.c6a39e3
pkgrel=1
pkgdesc='SSH library for hare'
url='https://sr.ht/~sircmpwn/hare-ssh'
license=(MPL2)
arch=(x86_64 aarch64)
depends=()
makedepends=(hare)
conflicts=(hare-ssh)
provides=(hare-ssh)
source=("git+https://git.sr.ht/~sircmpwn/hare-ssh")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

check() {
	cd "$_pkgname"
	make check
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
