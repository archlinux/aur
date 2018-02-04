# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_pkgname=dry
_pkgver=v0.9-beta.3
_pkgdownload=${_pkgname}_${_pkgver}
pkgname=dry-bin
pkgver=0.9
pkgrel=3
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
  '52b604e3f6aee56946b3a0d2d2fd536ea67379532279fddbe9c903540e1f6a5b'
)
else
source=(
  "${_pkgdownload}::https://github.com/moncho/dry/releases/download/${_pkgver}/dry-linux-amd64"
)
sha256sums=(
  '97818c8a662992d73e88ad9823175ab680f5fbbbaf156c5ece19a7ac884000fb'
)
fi

package() {
  install -Dm755 "${srcdir}/${_pkgdownload}" "${pkgdir}/usr/bin/${_pkgname}"
}
