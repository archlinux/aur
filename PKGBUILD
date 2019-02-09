# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego'
pkgver=v2.2.0
pkgrel=1
pkgdesc='Lets Encrypt client and ACME library written in Go'
url='https://github.com/xenolf/lego'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")

depends=()
makedepends=()

_basedownloadurl="${url}/releases/download/${pkgver}"
_basearchive="${pkgname}_${pkgver}_linux"

source_x86_64=("${_basedownloadurl}/${_basearchive}_amd64.tar.gz")
sha256sums_x86_64=('d7f43726bab3607ffb731737b2b4f3864d6691ce6ee3f298cbb73fdfd22f7295')

source_i686=("${_basedownloadurl}/${_basearchive}_386.tar.gz")
sha256sums_i686=('5430f68967772341ede411447a1bc9c02a4a9bc9be2632a1c3d903dfb72707c0')

source_armv7h=("${_basedownloadurl}/${_basearchive}_armv7.tar.gz")
sha256sums_armv7h=('f4c5ca2b58b3f4d53dcae18c56db8535fd20f35536b06179b48cbd6189c88a6d')

source_aarch64=("${_basedownloadurl}/${_basearchive}_arm64.tar.gz")
sha256sums_aarch64=('1783325831b86d52b93a69a351f9dfd4d4c2039652c78dc70071f7106813bcd1')

package() {
	# Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
