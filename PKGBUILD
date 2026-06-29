# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=takashialpha
_appname=audium
pkgname=${_appname}-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="A terminal music app: keyboard-driven, for people who live in the command line."
arch=('x86_64')
url="https://github.com/${_appauthor}/${_appname}"
_urlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/v${pkgver//_/-}"
license=('Apache-2.0')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'alsa-lib')

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-v${pkgver}-${arch[0]}-linux.tar.gz")
sha256sums=('11043dc3b95a4e945c9822eafc7f8810064f49a2f91bd59d1388dacf09949512'
            'a24266a5d80f4172e4356c8cdb0b72c0cc884f27afcc7f274a7a6a15eba5f366')
sha256sums_x86_64=('68524414185128443db67ea95e7f9e36907f5dd90461d9ae0076aa36fea46367')

_CARCH="${arch[0]}-unknown-linux-gnu"

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
