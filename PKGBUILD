# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=cras
pkgver=2.0.1
pkgrel=1
pkgdesc='The Anti-Procrastination Tool'
arch=('x86_64' 'aarch64')
url='https://sr.ht/~arivigo/cras'
license=('APACHE')
depends=('glibc')
source=("https://git.sr.ht/~arivigo/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a68a4f49b784d3e50618ba62888877e312d22e4d7a4e0d3879d9f7582c3e8498')

build() {
	cd "${pkgname}-${pkgver}"
	make
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" PREFIX='/usr' install
}
