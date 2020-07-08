# Maintainer: Guillaume Duboc <guilduboc@gmail.com>

pkgname=hyx
pkgver=2020.06.09
pkgrel=1
pkgdesc='A minimalistic, but powerful console hex editor'
url='https://yx7.cc/code/'
license=('MIT')
depends=('glibc')
source=("https://yx7.cc/code/hyx/hyx-${pkgver}.tar.xz")
sha512sums=("c2a0fb3b37f1589a9a810dafbc2fa3ea85ee41b988c7a8a9e3f577eb3f4b959a5516a7d059d46b1f5bb5127b2aed6381f7759f9185dfbcbb4489192ffc73e767")
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

