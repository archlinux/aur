# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=clp
pkgver=0.3.0
pkgrel=1
pkgdesc='writes input files to stdout with syntax highlighting'
arch=('x86_64' 'aarch64')
url="https://git.sr.ht/~eskin/clp"
license=('custom')
depends=('luajit' 'lua51-lpeg' 'lua51-luautf8')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~eskin/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a832775b68ba625106d0e58ec1ec646fe7f3abc8371e0a878c9ffe107be559bb')
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
