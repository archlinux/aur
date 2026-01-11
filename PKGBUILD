# Maintainer: Boris-Chengbiao Zhou <bobo1239@web.de>
# Contributor: Guillaume Duboc <guilduboc@gmail.com>

pkgname=hyx
pkgver=2026.01.11
pkgrel=1
pkgdesc='A minimalistic, but powerful console hex editor'
url='https://yx7.cc/code/'
license=('MIT')
depends=('glibc')
source=("https://yx7.cc/code/hyx/hyx-${pkgver}.tar.xz")
sha512sums=("fbe392a55b8d0c6c9ec49f8067f582d8b0a418c7ed36a1015bdb262a00278ce7d7198789ec6da567386faaa51303d6f1c144921e7ff3a10c0d269fddc52de90d")
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
