# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=roborev-dev
_pkgname=roborev
pkgname=${_pkgname}-bin
pkgdesc="Continuous background code review database for agents, work faster and smarter with accountability for every line of generated code."

pkgver=0.49.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('c0992197c4fa1f2fc02050d67223edaddf88c1eef9d82c52ef2f33c06243d849'
            '75486ea0af9309140ca6e2c401d7e67bea8f4892344e5707f6394dc5e83dfc44')
sha256sums_x86_64=('9ea497d82bf1b82a75d37675001d070c40c3343227aee308cd044b5abec7691c')
sha256sums_aarch64=('672bd666d1fc0e1266652af33ca9543bb103bf4a7d41030234fbb01a82caf27e')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
