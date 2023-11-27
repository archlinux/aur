# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=himitsu-ssh-git
_pkgname=${pkgname%-git}
pkgver=r30.78eaa23
pkgrel=1
pkgdesc='SSH integration for Himitsu'
url='https://sr.ht/~sircmpwn/himitsu-ssh'
license=(GPL-3.0)
arch=(x86_64 aarch64)
depends=()
makedepends=(hare hare-ssh)
conflicts=(himitsu-ssh)
provides=(himitsu-ssh)
source=("git+https://git.sr.ht/~sircmpwn/himitsu-ssh")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
}
