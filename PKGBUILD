# Maintainer: SoftExpert <softexpert at gmail dot com>
_pkgname=httptap
pkgname=${_pkgname}-bin
pkgver=0.0.6
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
	"LICENSE"::"https://raw.githubusercontent.com/monasticacademy/httptap/refs/heads/main/LICENSE"
)
b2sums_x86_64=('7be51906e4975003d8b09c70202a28dd5d50dfb4b0f55f42e20dd8dd243c6b66b6483b412fbd202f1960e54250ad744f315e77bade8292e7c3ae3aec007294be'
               '774ba9998cf1fb77ec3a483c5435df163c32bf6f8ed5dbefb015875f534d3c2db31b20b634868120faedbe66c57fb6609c37990b147ba451b97aa2a03380aa6d')

#prepare() {
#	bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}/"
#}

#build() {
#}

package() {
	install -Dm755 ${_pkgname} "${pkgdir}/usr/local/bin/${_pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
