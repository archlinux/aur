# Maintainer: Marcel Robitaille mail@marcelrobitaille.me
pkgname=lead-git
pkgver=r38.8c2557e
pkgrel=1
pkgdesc="lead provides hot-corners for your desktop, notably for openbox, awesome, i3 and other window managers."
arch=("i686" "x86_64")
url="https://github.com/MageJohn/lead"
license=('MIT')
depends=('qt5-base')
makedepends=('git' 'clang' 'gcc' 'make' 'libqtxdg')
source=('lead-git::git+https://github.com/MageJohn/lead.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	make
}

package() {
	cd "$srcdir/${pkgname}"
	cp -r data/* "$pkgdir"
}
