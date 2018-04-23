# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_pkgname=dry
_pkgver=v0.9-beta.4
_pkgdownload=${_pkgname}_${_pkgver}
pkgname=dry-bin
pkgver=0.9
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
  'f6666319b7dfa7889f1bd588b803ab626b1aae7c26a8a6aad87434da771d59c3'
)
else
source=(
  "${_pkgdownload}::https://github.com/moncho/dry/releases/download/${_pkgver}/dry-linux-amd64"
)
sha256sums=(
  '9f0a884ea8570295117c4ae0092d1c5025b39ea06c98d9e4f904524d95e94a68'
)
fi

package() {
  install -Dm755 "${srcdir}/${_pkgdownload}" "${pkgdir}/usr/bin/${_pkgname}"
}
