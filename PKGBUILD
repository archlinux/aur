# Maintainer: SoftExpert <softexpert at gmail dot com>
_pkgname=httptap
pkgname=${_pkgname}-bin
pkgver=0.0.5
pkgrel=1
pkgdesc='Utility to view the HTTP and HTTPS requests made by a linux program'
arch=(x86_64)
url='https://github.com/monasticacademy/httptap'
license=(MIT)
depends=(
	# As reported by namcap
	gcc-libs
	glib2
	glibc
)
provides=(htptap)
conflicts=(
	htptap
	htptap-bin
)
options=(
	!strip     # Stripping symbols would break the binary
	!emptydirs # Remove empty directories from package because why not
)
source_x86_64=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/monasticacademy/httptap/releases/download/v${pkgver}/httptap_linux_x86_64.tar.gz"
)
b2sums_x86_64=('4e5a4a6e338537282a1bee0240252472b7e6b40833e6bf2adcb673236d4d8c80bfe81a3f9b948d5ec4d3a7917f17866a9050f03e4e0bb5514b67235e7fa16ebb')

#prepare() {
#	bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}/"
#}

#build() {
#}

package() {
	install -Dm755 ${_pkgname} "${pkgdir}/usr/local/bin/${_pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
