# Maintainer: mark dot blakeney at bullet-systems dot net
# Contributor: Danilo Kuehn <dk[at]nogo-software[dot]de>
_pkgname=dry
pkgname=$_pkgname-bin
pkgver=0.11.2
pkgrel=1
pkgdesc="dry: a terminal application to manage Docker containers and images"
url="https://github.com/moncho/$_pkgname"
arch=("x86_64" "i686" "armv7h" "aarch64")
license=("MIT")
depends=("docker")
_pkgdownload=${_pkgname}_${pkgver}
source_x86_64=("${_pkgdownload}-x86_64::$url/releases/download/v${pkgver}/$_pkgname-linux-amd64")
source_i686=("${_pkgdownload}-i686::$url/releases/download/v${pkgver}/$_pkgname-linux-386")
source_armv7h=("${_pkgdownload}-armv7h::$url/releases/download/v${pkgver}/$_pkgname-linux-arm")
source_aarch64=("${_pkgdownload}-aarch64::$url/releases/download/v${pkgver}/$_pkgname-linux-arm64")
sha256sums_x86_64=('7c213bac6d51a0450e48c9c5358b38d158431168b32f1ce443e58550e90f8157')
sha256sums_i686=('438834b4fef9bb73fe26644c3e73003b77ea851e76db1644cf889c601ddf6d5e')
sha256sums_armv7h=('97bce47e37c725cfac1fd95fa30bc79738bdba30947a7275b7e6245fbd470ad8')
sha256sums_aarch64=('e8a081333a6c53c2c3d5614e0442d077fad80a198fd40e7185528bcfd489ebec')

package() {
  install -Dm755 "${srcdir}/${_pkgdownload}-$CARCH" "${pkgdir}/usr/bin/${_pkgname}"
}
