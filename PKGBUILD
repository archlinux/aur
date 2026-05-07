# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=frypan05
_pkgname=Volt
_appname=${_pkgname,,}
pkgname=${_appname}-bin
pkgdesc="Terminal Based Binary for API Testing"

pkgver=1.3.4
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
sha256sums=('078c2fced42cadc70d34f19eee4e733243b9cabea18910b359d737bf140124b0')
sha256sums_x86_64=('3826b5105b93bdcd4fafc7abd75a02ceb3bb43424166798eeb2e57004e30077c')
sha256sums_aarch64=('98aeaeb633d6c8c4b9888c031f830cf33878865103e2dedceca483f44175f433')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
