# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appauthor=takashialpha
_appname=audium
pkgname=${_appname}-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A keyboard-driven music app for people who live in the terminal."
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
sha256sums=('041a50c9963c05b9f4bbad20055cae184702f81f2898aa5142eac7c356e309aa'
            'a24266a5d80f4172e4356c8cdb0b72c0cc884f27afcc7f274a7a6a15eba5f366')
sha256sums_x86_64=('e7781999e65e4e5ee8b06ab676d2d9abbe0e825d2996e197d9a4013ece9fa99a')

_CARCH="${arch[0]}-unknown-linux-gnu"

package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}-${_CARCH}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
