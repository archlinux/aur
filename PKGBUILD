# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=ClementNerma
_appname=Jumpy
_execname=${_appname,,}
pkgname=${_execname}-bin
pkgver=0.4.11
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
            '457969d48eb5387e850dee8a6ac6ab7a0ca66ec91acd4ad3b573d7df08a7887f')
sha256sums_x86_64=('95b2a51abd4f42c6ad941e6c2990ca090277a946a9a6e44c9a330563bb20e16a')
sha256sums_aarch64=('95b2a51abd4f42c6ad941e6c2990ca090277a946a9a6e44c9a330563bb20e16a')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_execname}" "${pkgdir}/usr/bin/${_execname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
