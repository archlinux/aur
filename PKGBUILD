# Contributor: Xenose <xenose@live.com>

pkgname=split-run-git
pkgver=r9.b3cbe12
pkgrel=1
arch=('x86_64')
pkgdesc="Launches programs from the terminal and the closes the terminal automatically"
url="https://gitlab.com/Xenose/split-run"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd split-run
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd split-run
	gcc -o srun $CFLAGS $LDFLAGS Source.c
}

package() {
	cd split-run
	install -Dm755 srun -t "$pkgdir/usr/bin"
}
