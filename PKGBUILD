# Maintainer: Vaishakh G K <vaishakh@vaishakhgk.com>
pkgname='ash-git'
pkgver=r12.7418f82
pkgrel=1
pkgdesc="A Shell - Simple shell made in c"
arch=('x86_64')
url="https://codeberg.org/VAISHAKH-GK/ash"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('make' 'gcc')
source=("$pkgname::git+https://codeberg.org/VAISHAKH-GK/ash.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$pkgname"
	make build
}

package() {
	cd "$pkgname"
    install -Dm755 "./ash" "$pkgdir/usr/bin/ash"
    install -Dm644 "./README.org" "$pkgdir/usr/share/doc/$pkgname"
}
