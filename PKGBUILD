# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=takashialpha
_appname=audium
pkgname=${_appname}-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A terminal music app: keyboard-driven, for people who live in the command line."
arch=('x86_64')
url="https://github.com/${_appauthor}/${_appname}"
_urlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/v${pkgver//_/-}"
license=('GPL-3.0-or-later')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'alsa-lib')

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-v${pkgver}-${arch[0]}-linux.tar.gz")
sha256sums=('6c308c70f897b3aad3e5b3894c4302289e6a292caa96b4ba63c2caf1f0778b75'
            '6dccfd4cddda7e95dc4ea3741438378f36d61d870e44171afbaa9fb75ab46d06')
sha256sums_x86_64=('8520040bf7e02c60e23c374cac84fb8ce947b0dd83003279e46cea3653362d1a')

_CARCH="${arch[0]}-unknown-linux-gnu"

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
