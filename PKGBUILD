# Contributor: LabRicecat <labricecat@duck.com>

pkgname='mkfh-git'
pkgver=r16.87d32a0
pkgrel=1
pkgdesc="Make File Hierarchy"
arch=('x86_64')
url="https://codeberg.org/LabRicecat/mkfh"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('mkfh')
conflicts=('mkfh')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "mkfh"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "mkfh"
	make
}

package() {
	cd "mkfh"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm755 mkfh "$pkgdir/usr/bin/mkfh"
}
