# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=9seconds
_gitname=shebang
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A sometimes nice way of doing CLI. Mostly harmless. Works on thursdays."

pkgver=2026.10.19
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${pkgver}-${_barch[1]}.tar.gz")
sha256sums_x86_64=('12379c9ddb962e9b7b7c2ee77719ac88b52e9a8d8a6963bc25a9f6cc6c434b2f')
sha256sums_aarch64=('5b2d35be2e2b8f0456dc21f69fa44e258ca7c7540dcf6b7d3db34e8fb042b20f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
