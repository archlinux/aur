# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kkdai
_pkgname=youtube
_appname=youtubedr
pkgname=${_appname}-bin
pkgver=2.10.7
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Download YouTube videos"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}_${pkgver}_linux_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}_${pkgver}_linux_${_barch[1]}.tar.gz")
sha256sums_x86_64=('b4719fda114df0613fb249d4f5a09316dfadbd43f0b9ab99ee49d64506cf956a')
sha256sums_aarch64=('328cec8e7c25e85751e3e5d03e19593f0413185ef88eddc9878bd85f096c227c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
