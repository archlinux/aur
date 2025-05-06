# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=pkgxdev
_pkgname=pkgx
pkgname=${_pkgname}-bin
pkgver=2.7.0
pkgrel=1
pkgdesc='Run Anything'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc' 'gcc-libs')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.txt"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}+linux+${arch[0]/_/-}.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}+linux+${arch[1]}.tar.xz")
sha256sums=('f9e73cf0b1182acbe4d2c623f9970c131c0be0d955bb0609cd98551eabf9f118'
            'b9d1518d76529c839bc978f8d126d91c90bcdeb08fa1b853e70adc42c7c40e80')
sha256sums_x86_64=('002583c69d591f96e2bd6e5d63dd41ae2308487dca1620891433c0a91c1e9476')
sha256sums_aarch64=('d199a718775e01b9d796cf0cae6b3d421f3c4a4b6bc4a86c10281e3ea86dfd2f')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "./${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "./LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "./README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
