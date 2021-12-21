# Maintainer: GN Vageesh <vageeshgn2005@gmail.com>
pkgname=lineo-git
pkgver=1
pkgrel=1
pkgdesc="A fast line counter for files"
arch=('x86_64')
url="https://github.com/GNVageesh/lineo-git.git"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
 	cd "$pkgname"
  	printf "1r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	sudo make install
}

package() {
	cd "$pkgname"
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
