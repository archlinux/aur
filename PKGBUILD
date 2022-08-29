# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=clp
pkgver=0.2.0
pkgrel=1
pkgdesc='writes input files to stdout with syntax highlighting'
arch=('x86_64' 'aarch64')
url="https://git.sr.ht/~eskin/clp"
license=('custom')
depends=('luajit' 'lua-lpeg')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~eskin/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('fd2c44847b7746351bf9193040a06014c7c494010ffd034c42fdd66afb49a62e')
conflicts=("${pkgname}-git")

build() {
	cd "${pkgname}-v${pkgver}"
	./configure
  make
}

package() {
	cd "${pkgname}-v${pkgver}"
	make MANPREFIX=/usr/share/man DESTDIR="${pkgdir}" PREFIX='/usr' install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
