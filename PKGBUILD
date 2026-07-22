# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=praetorian-inc
_gitname=nerva
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Fast service fingerprinting CLI for 170+ protocols (TCP/UDP/SCTP)"

pkgver=1.42.12
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
sha256sums_x86_64=('ab49f2476963be494fa01cb431bac96336224e358173dae67ce0713115c70cb2')
sha256sums_aarch64=('adbc7c81e292a3e1b9a52f23a4282ba43afcce5a92ea9efba2c867bccba77bda')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

