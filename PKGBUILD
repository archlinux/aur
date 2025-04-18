# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=ClementNerma
_appname=Jumpy
_execname=${_appname,,}
pkgname=${_execname}-bin
pkgver=0.4.10
pkgrel=1
pkgdesc="A faster, lightweight alternative to Zoxide"
arch=('x86_64' 'aarch64')
url="https://github.com/${_appauthor}/${_appname}"
_urlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/v${pkgver}"
license=('Apache-2.0')

depends=()
provides=("${_appname}")
conflicts=("${_appname}")

source=("LICENSE-${pkgver}::${_urlraw//v${pkgver}/master}/LICENSE.md"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_execname}-${arch[0]}-unknown-linux-musl.tgz")
source_aarch64=("${pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_execname}-${arch[0]}-unknown-linux-musl.tgz")
sha256sums=('efe25c1d429a558b4c784691119aa8c3dfee24910f4cb0e97b79bc0a79fd2cc1'
            '81f585720c5c9e7717789d720d2b87f381eeb5705b1de3ec893aa377330ed4b1')
sha256sums_x86_64=('3ff576e5b6de707724bbc73c9d149a60f951339e29b3052cafde11a0927fe865')
sha256sums_aarch64=('3ff576e5b6de707724bbc73c9d149a60f951339e29b3052cafde11a0927fe865')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
