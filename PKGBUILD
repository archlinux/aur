# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=magico
pkgver=r3.6b1bc0d
pkgrel=2
pkgdesc="A minimalist AUR Helper"
arch=('x86_64')
url="https://github.com/archlinux-br-dev/magico"
license=('GPL')
depends=('jq')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm755 magico ${pkgdir}/usr/bin/magico
}
