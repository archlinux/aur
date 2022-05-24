# Maintainer: Amirul Fitri <tounghacker@gmail.com>

pkgname=rom-parser-git
pkgver=20170330
pkgrel=1
pkgdesc="PCI device rom parser/fixer."
arch=('x86_64')
url="https://github.com/awilliam/rom-parser"
license=('unknown')
depends=('glibc')
makedepends=('git')
source=("${pkgname}::git+https://github.com/awilliam/rom-parser")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git log -1 --date=format:%Y%m%d --pretty=%cd
}

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	install -Dm755 rom-parser "${pkgdir}"/usr/bin/rom-parser
	install -Dm755 rom-fixer "${pkgdir}"/usr/bin/rom-fixer
}
