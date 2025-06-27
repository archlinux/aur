# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=untitaker
_pkgname=quickenv
pkgname=${_pkgname}-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="An unintrusive environment manager"
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

# https://github.com/untitaker/quickenv/releases/download/0.4.4/quickenv-x86_64-unknown-linux-gnu.tar.xz
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.xz")

# https://github.com/untitaker/quickenv/releases/download/0.4.4/quickenv-aarch64-unknown-linux-gnu.tar.xz
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('aa1a9b517d4a1ecb64fc9e45b59cbd6ec05a8ef8a533872316f2c6c1dba53d25')
sha256sums_aarch64=('4c7d3aede027328f2f7a90a68c491bb5c33a03a7bd0849c0f2943fc011b10f40')


package() {
	cd "${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
