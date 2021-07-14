# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=schain
pkgver=2.3.0
pkgrel=1
pkgdesc='A simple habit tracker'
arch=('x86_64' 'aarch64')
url="https://sr.ht/~arivigo/${pkgname}"
license=('APACHE')
depends=('glibc')
source=("https://git.sr.ht/~arivigo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a63b4bf1159e048e23e4fe5411ad65bd3222fdea18a8c0dbfce3ed8b7b9dca51')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX='/usr' install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
