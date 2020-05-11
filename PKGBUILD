# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego'
pkgver=v3.7.0
pkgrel=1
pkgdesc='Lets Encrypt client and ACME library written in Go'
url='https://go-acme.github.io/lego/'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

depends=()
makedepends=()

_url='https://github.com/go-acme/lego'
_basedownloadurl="${_url}/releases/download/${pkgver}"
_basearchive="${pkgname}_${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('d2328f3e087c1465c2582d9d38c992cdab460a24a7a89d3260af83cd143a8b39')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('5b2f76ff51f14e77ddc911feb3f64b158e0f3ff1abadfaa75dd9b3489db9f673')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('5917ca09857dea6417182a9aecdab7d912a8e8e8c01897ae4bf7f58adbe9fc90')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('18deae2011b2882dfbde334069c1e47e92062a56c1245ac051fae0803f39af4d')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
