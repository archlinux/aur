# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=hyx
pkgver=0.1.4
pkgrel=1
pkgdesc='A minimalistic, but powerful console hex editor'
url='https://yx7.cc/code/'
license=('MIT')
depends=('glibc')
source=("https://yx7.cc/code/hyx/hyx-${pkgver}.tar.xz")
sha512sums=('11de1144af1514b6517138333063947fcb0b22e21eacdc37cb30ea4db106112d410d182b42480348e1915dbb1878efddd441a066ce42977c8a0fa560a39ed5b7')
arch=('i686' 'x86_64')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 'license.txt' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

