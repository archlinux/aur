# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=abh1nav9
_gitname=kyrc
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A fast, offline, keyboard-only typing test that lives in your terminal"

pkgver=0.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://${_appname}.vercel.app/"
_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('8ba06045b5f2bf8f2d8980ef72a7e7798f44a9313d50d3e3323921876aa5fd41')
sha256sums_aarch64=('e08ef17cbafe5a56911db29bd696609684cb7ea45bb7ec9b5968ff308a33adc5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
