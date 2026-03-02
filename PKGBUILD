# Maintainer: mark dot blakeney at bullet-systems dot net
# Contributor: Danilo Kuehn <dk[at]nogo-software[dot]de>
_pkgname=dry
pkgname=$_pkgname-bin
pkgver=0.12.1
pkgrel=1
pkgdesc="dry: a terminal application to manage Docker containers and images"
url="https://github.com/moncho/$_pkgname"
arch=("x86_64" "i686" "armv7h" "aarch64")
license=("MIT")
depends=("docker")
_pkgdownload=${_pkgname}_${pkgver}
source_x86_64=("${_pkgdownload}-x86_64::$url/releases/download/v${pkgver}/$_pkgname-linux-amd64")
source_i686=("${_pkgdownload}-i686::$url/releases/download/v${pkgver}/$_pkgname-linux-386")
source_armv7h=("${_pkgdownload}-armv7h::$url/releases/download/v${pkgver}/$_pkgname-linux-armv7")
source_aarch64=("${_pkgdownload}-aarch64::$url/releases/download/v${pkgver}/$_pkgname-linux-arm64")
sha256sums_x86_64=('cb38b16d1f45cd6fd9360e9191fff595e7df5604013f6fb0d47f654cf6cdbe70')
sha256sums_i686=('0c42ea9c74f525f7a0ec4254241f9130c1c985e98b482e680b2e83902399292f')
sha256sums_armv7h=('6e40489840ea9517fa5e1a5f63043f9caa542873bc7f605f993adb2ca34f5afc')
sha256sums_aarch64=('8309aae6b6fc2c580e5863cd3436bbe9b22fe0a45a4d57c90691f8795debb5c9')

package() {
  install -Dm755 "${srcdir}/${_pkgdownload}-$CARCH" "${pkgdir}/usr/bin/${_pkgname}"
}
