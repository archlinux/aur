# Maintainer: Patrick Kurth <p.kurth@posteo.de>

pkgname=lapidoc-man
pkgver=r5.99041d0
pkgrel=1
pkgdesc="Lua API Functions Man Pages"
arch=('any')
url="https://github.com/patrickschulz/lapidoc-man"
source=("git+https://github.com/patrickschulz/lapidoc-man.git")
sha256sums=('SKIP')
depends=()
makedepends=('git' 'lua')
license=('MIT')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    make
}

package() {
	mkdir -p "${pkgdir}/usr/share/man/man3"
	cd "${srcdir}/${pkgname}"
	install -m 644 -C man3/* "${pkgdir}/usr/share/man/man3/"
}
