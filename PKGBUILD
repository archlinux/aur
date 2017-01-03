# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=hyx
pkgver=0.1.1
pkgrel=1
pkgdesc='A minimalistic, but powerful console hex editor'
url='https://home.in.tum.de/~panny/'
license=('custom')
depends=('glibc')
source=("https://home.in.tum.de/~panny/f/hyx-${pkgver}.tar.xz")
sha512sums=('14b8210d964b65ded450e6158fc241c780c771b19dea8877eb44ca570fae1c5ef4a3df387e8faecaaed3bd9d5dde18b09f585456731b1230744d2bd507c94427')
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

