# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=takashialpha
_appname=swagsh
pkgname=${_appname}-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A fast, minimal, modern Linux shell. Named after swag, slang for stylish flair."
arch=('x86_64')
url="https://github.com/${_appauthor}/${_appname}"
_urlraw="https://raw.githubusercontent.com/${_appauthor}/${_appname}/v${pkgver//_/-}"
license=('GPL-3.0-or-later')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

install=${_appname}.install

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/${_appname}-v${pkgver}-${arch[0]}-linux.tar.gz")
sha256sums=('8bd93ff47fac0c0a9fbb1a515380fc38559ed224cdedf65667241f41a7d08480'
            'a24266a5d80f4172e4356c8cdb0b72c0cc884f27afcc7f274a7a6a15eba5f366')
sha256sums_x86_64=('e0a297e85961fba768718feca4c937e1ec7cd40687e2d9dca32649fe8ea62d10')

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
