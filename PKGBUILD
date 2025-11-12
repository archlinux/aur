#
# PKGBUILD for ddhx
#
# Maintainer: Uffe Jakobsen: uffe _.at._ uffe _.dot._ org
#

pkgname=ddhx
_pkgname=ddhx
pkgver=0.7.2
pkg_name_ver="${_pkgname}-${pkgver}"
pkgrel=1
pkgdesc="Console hexadecimal file viewer"
arch=('x86_64')
url="https://github.com/dd86k/ddhx"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'dub' 'dmd')
provides=("ddhx")
conflicts=("ddhx")
source=("https://github.com/dd86k/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('35a39fce94738ee370e6690274e25d2a1bc7aa1a2212f5121a4061ffa224dab8')

#pkgver() {
#  cd "${srcdir}/${pkg_name_ver}"
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

prepare()
{
  cd "${srcdir}/${pkg_name_ver}"
}

build() {
	cd "${srcdir}/${pkg_name_ver}"
	dub build -b release-nobounds
}

package() {
	cd "${srcdir}/${pkg_name_ver}"
	install -D ddhx "${pkgdir}/usr/bin/ddhx"
	install -D -m 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m 0644 README "${pkgdir}/usr/share/doc/${_pkgname}/README"
	#install -D -m 0644 docs/ddhx.1 "${pkgdir}/usr/share/man/man1/ddhx.1"
	#install -D -m 0644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

#
# EOF
#
