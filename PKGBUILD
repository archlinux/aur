# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=pkgxdev
_pkgname=pkgx
pkgname=${_pkgname}-bin
pkgver=2.10.2
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
sha256sums_x86_64=('780e1a1b2c15cd927640ab9fb73e00c2806189a60f84c5965407ff1f4e7066d6')
sha256sums_aarch64=('0aa1be5c66e69ef7f40370c26215200703f9381482f8001309b5be9c50878862')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "./${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "./LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "./README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
