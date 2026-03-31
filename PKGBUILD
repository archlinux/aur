# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=frypan05
_pkgname=Volt
_appname=${_pkgname,,}
pkgname=${_appname}-bin
pkgdesc="Terminal Based Binary for API Testing"

pkgver=1.3.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('3b7f0aa538f823c30b2e444949c12b49fd95fced698ea2ebf5cd85fe11a2f6de')
sha256sums_x86_64=('d8da305b01d53ae3a216b88fad80f4a48676e8919f94e4c2a95f6b7a51a4658e')
sha256sums_aarch64=('24a5f0e48b12ed43eb78c47e3f427b724b95f1211c949099d329d4b5dc3b3f36')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
