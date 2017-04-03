# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_pkgname=dry
_pkgver=v0.7-beta.4
_pkgdownload=${_pkgname}_${_pkgver}
pkgname=dry-bin
pkgver=0.7
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
  'f3660f121e35a2aefe364f869cf2179115306f3b92b8c29c9ecfa5323ec40f08'
)
else
source=(
  "${_pkgdownload}::https://github.com/moncho/dry/releases/download/${_pkgver}/dry-linux-amd64"
)
sha256sums=(
  '8b9f624b2befbe6779c578c7dc492458b88e6d71f3ff2e01064183b2b409aab1'
)
fi

package() {
  install -Dm755 "${srcdir}/${_pkgdownload}" "${pkgdir}/usr/bin/${_pkgname}"
}
