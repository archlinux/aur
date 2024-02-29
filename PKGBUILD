# Maintainer: Boris-Chengbiao Zhou <bobo1239@web.de>
# Contributor: Guillaume Duboc <guilduboc@gmail.com>

pkgname=hyx
pkgver=2024.02.29
pkgrel=1
pkgdesc='A minimalistic, but powerful console hex editor'
url='https://yx7.cc/code/'
license=('MIT')
depends=('glibc')
source=("https://yx7.cc/code/hyx/hyx-${pkgver}.tar.xz")
sha512sums=("b5c17b045d1c97106212745b1bb4c4052cfe7ac5a28ec0a2240764785410d7e68292d0ff976fbdc58172cd9433ce49b1cad89b767e09d5d6207088a6a60b4e85")
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
