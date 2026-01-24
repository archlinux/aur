# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=TheYkk
_pkgname=git-switcher
pkgname=${_pkgname}-bin
pkgdesc="Easily switch between your git profiles"

pkgver=0.6
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_arch_suffix="unknown-linux-gnu"

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${arch[0]}-${_arch_suffix}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}-${arch[1]}-${_arch_suffix}.tar.gz")
sha256sums_x86_64=('65f2ff27d1fff89f844324487645795c10c607baf3b0f3d4f6f5f53224e50114')
sha256sums_aarch64=('889a13dcf6b62b6ec3f129f759eb1a30f0cc750d27e28a1291b0054311d14f37')


package() {
	cd "${srcdir}/${_pkgname}-${CARCH}-${_arch_suffix}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
