# Maintainer: Danilo Kuehn <dk[at]nogo-software[dot]de>

_pkgname=dry
_pkgver=v0.9-beta.1
_pkgdownload=${_pkgname}_${_pkgver}
pkgname=dry-bin
pkgver=0.9
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
  '246743a542124096ad34d5bbd6e49dac7acd06137eb5e0bdacfe8ef574e7c0db'
)
else
source=(
  "${_pkgdownload}::https://github.com/moncho/dry/releases/download/${_pkgver}/dry-linux-amd64"
)
sha256sums=(
  '02ccdce572e6cfeb66581ac881a3b44087e35d39aff3d16b5fdddffc2cbf522c'
)
fi

package() {
  install -Dm755 "${srcdir}/${_pkgdownload}" "${pkgdir}/usr/bin/${_pkgname}"
}
