# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_pkgname=dry
_pkgver=v0.8-beta.1
_pkgdownload=${_pkgname}_${_pkgver}
pkgname=dry-bin
pkgver=0.8
pkgrel=1
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
  'fe88f189520ea765429b4fa753173eee991a030fcb2037b744f9f532836cc50c'
)
else
source=(
  "${_pkgdownload}::https://github.com/moncho/dry/releases/download/${_pkgver}/dry-linux-amd64"
)
sha256sums=(
  'ee29dbee839344a1b720aeac69f224794853709178ef7e795e26fe50ed90d925'
)
fi

package() {
  install -Dm755 "${srcdir}/${_pkgdownload}" "${pkgdir}/usr/bin/${_pkgname}"
}
