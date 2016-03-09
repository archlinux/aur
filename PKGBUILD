# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=firenzina
pkgver=2.4.3
pkgrel=1
pkgdesc="Firenzina $pkgver xTreme is a free, open-source UCI chess engine, a derivative of Fire 2.2 xTreme"
arch=('i686' 'x86_64')
url="https://firenzina.wikispaces.com/"
license=('GPL')
conflicts=("$pkgname-git")
provides=("$pkgname=$pkgver")
options=(!emptydirs)
source=("https://firenzina.wikispaces.com/file/view/Firenzina_2-4-3_sources.zip/533596960/Firenzina_2-4-3_sources.zip"
	"makefile.patch")

md5sums=('3a20edf1dc4269210e6ce036e00d1aac'
	 "0d7b3d1f5d2d339dc7685587786ec5ac")

prepare() {
	cd "${srcdir}/Firenzina_2-4-3/Firenzina/"
	patch -Np1 -i "${srcdir}/makefile.patch"
}

build() {
	cd "${srcdir}/Firenzina_2-4-3/Firenzina/"
	make
}

package() {
	cd "${srcdir}/Firenzina_2-4-3/Firenzina/"
	install -Dm0755 fire ${pkgdir}/usr/bin/$pkgname
}
