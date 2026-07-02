# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=praetorian-inc
_gitname=augustus
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="LLM security testing framework for detecting prompt injection, jailbreaks, and adversarial attacks with 190+ probes and 28 providers"

pkgver=0.9.4
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('a8aeea1bf4741566984b25ca70f12ff39798fac8530966495a126addaac6674a')
sha256sums_aarch64=('9cfb8a7f0f76f9fd2bbea38e450475f32eab52c3771c4d213ccff58777902aa3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

