# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=cho-git
pkgver=r10.f9e1a04
pkgrel=1
pkgdesc="The safe echo & quoting utility you always knew you needed"
arch=('x86_64')
url="https://github.com/jaggzh/cho"
license=('unknown')
depends=()
makedepends=('git' 'gcc' 'make')
provides=('cho')
conflicts=('cho')
source=("cho::git+https://github.com/jaggzh/cho.git")
sha256sums=('SKIP')
function pkgver() {
	cd cho
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
function build() {
	cd cho
	make
}
function package() {
	cd cho
	install -Dm755 cho "$pkgdir/usr/bin/cho"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
