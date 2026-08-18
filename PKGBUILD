# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=praetorian-inc
_gitname=julius
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Simple LLM service identification - translate IP:Port to Ollama, vLLM, LiteLLM, or 60+ other AI services in seconds"

pkgver=1.4.11
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
sha256sums_x86_64=('9ccddfb3ac026b350273e9fc80af592c3fb3b227f14acd983d808663fa9f295f')
sha256sums_aarch64=('d23d4e4ce18066124e183c78580322bbb3fd654951d820d0c697c093416c7fb7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

