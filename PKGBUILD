# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_pkgname=dry
_pkgver=v0.8-beta.4
_pkgdownload=${_pkgname}_${_pkgver}
pkgname=dry-bin
pkgver=0.8
pkgrel=4
pkgdesc="dry is a terminal application to manage Docker containers and images"
url="http://moncho.github.io/dry/"
arch=('x86_64' 'i686')
license=('MIT')
depends=('docker')
if test "$CARCH" == i686; then
source=(
  "${_pkgdownlad}::https://github.com/moncho/dry/releases/download/${_pkgver}/dry-linux-386"
)
sha256sums=(
  'c8aa6d59adcf4562ea621764f91d906a3b9b2fa5cc96fa87a9395d1832f78cf9'
)
else
source=(
  "${_pkgdownload}::https://github.com/moncho/dry/releases/download/${_pkgver}/dry-linux-amd64"
)
sha256sums=(
  'f82f53c029f278b6e1ca64ea8f04b5a8886b74cf435c568cf256ab2fbd9525ba'
)
fi

package() {
  install -Dm755 "${srcdir}/${_pkgdownload}" "${pkgdir}/usr/bin/${_pkgname}"
}
