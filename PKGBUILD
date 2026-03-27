# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=pkgxdev
_pkgname=pkgx
pkgname=${_pkgname}-bin
pkgver=2.10.1
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
            '1b429e0a14843b1d8377a04aa15180df320027c493baa9c625604cb5706c5ef6')
sha256sums_x86_64=('6580fbe9e8dc79fdfc402502515fc8b4d377961c1b1a50b8d8e775ac96148afb')
sha256sums_aarch64=('6936c2498fcea212ab05d57ac1bd5de79464051e405c882ac059bc00c5218bde')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "./${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "./LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "./README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
