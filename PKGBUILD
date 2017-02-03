# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=hyx
pkgver=0.1.3
pkgrel=1
pkgdesc='A minimalistic, but powerful console hex editor'
url='https://home.in.tum.de/~panny/'
license=('MIT')
depends=('glibc')
source=("https://home.in.tum.de/~panny/f/hyx-${pkgver}.tar.xz")
sha512sums=('dbc813dcf186e556cc17bd42b37bb2b66a9531e3ba827db410acdac73567b9a4910458dd2f16a957cd97723e8952fb342d794488af1e9e34f440a6f76b139b1b')
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

