# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_pkgname=dry
_pkgver=v0.6-alpha.5
pkgname=dry-bin
pkgver=0.6
pkgrel=5
pkgdesc="dry is a terminal application to manage Docker containers and images"
url="http://moncho.github.io/dry/"
arch=('x86_64' 'i686')
license=('MIT')
depends=('docker')
if test "$CARCH" == i686; then
source=(
  "${_pkgname}::https://github.com/moncho/dry/releases/download/${_pkgver}/dry-linux-386"
)
sha256sums=(
  '814f9c65066d43e4c395e5f929c723ecc37b7bf3c855db2cf79f8733eb8e17ae'
)
else
source=(
  "${_pkgname}::https://github.com/moncho/dry/releases/download/${_pkgver}/dry-linux-amd64"
)
sha256sums=(
  'c787562a8b7276e755b9d9a8e9eb3717237866ea18fe7fe79aa076875fc6eb3e'
)
fi

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
