# Maintainer: Your Name <mgaldi@dons.usfca.edu>
pkgname='nash'
pkgver=r29.38fc82d
pkgrel=1
pkgdesc="Not A Shell, a shell"
arch=('x86_64')
url="https://github.com/mgaldi/nash"
license=('MIT')
depends=('glibc')
makedepends=(git make)
source=('nash::git://github.com/mgaldi/nash.git')
md5sums=('SKIP')

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
    install -Dm755 ./nash "$pkgdir/usr/bin/nash"
    install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
