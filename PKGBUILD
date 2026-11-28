# Maintainer: Xefreh

_pkgname=open-java-format
pkgname="${_pkgname}-bin"
pkgver=21.1.1
pkgrel=1
pkgdesc='A modern, lambda-friendly, 120 character Java formatter (native CLI)'
arch=('x86_64' 'aarch64')
url='https://openjavaformat.dev'
license=('Apache-2.0')
depends=('glibc' 'zlib')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
_ghurl="https://github.com/openjavaformat/${_pkgname}"
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/openjavaformat/${_pkgname}/${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${_ghurl}/releases/download/${pkgver}/${_pkgname}-linux-glibc_x86-64")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${_ghurl}/releases/download/${pkgver}/${_pkgname}-linux-glibc_aarch64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('4a98ed911f041e246bc2b7173a939bbe3e1ade4ec4ebc13494d29859e1384c44')
sha256sums_aarch64=('7f7a65c26d0c82129812dea2eb052a24a0d8a17b10c25855d1cd6b9e390dc596')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
