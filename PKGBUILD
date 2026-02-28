# Maintainer: mark dot blakeney at bullet-systems dot net
# Contributor: Danilo Kuehn <dk[at]nogo-software[dot]de>
_pkgname=dry
pkgname=$_pkgname-bin
pkgver=0.12.0
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
sha256sums_x86_64=('f8e580faa44bf70dfe6b2ead0e7a95fc64ad1a9becd6c6fce999de761b52a714')
sha256sums_i686=('bf02be6fc7bdf4550f35c4b2c32b4bf27eb5ef1e4c99f985f02e3b447d1ed758')
sha256sums_armv7h=('d8a3594943ba4d7b60e0f58ee1cd712cb790200738234da5944362043ef817ed')
sha256sums_aarch64=('da903aeb820a68d15db327747ebfc5434329e3269cf2978ab3657cb85981edd4')

package() {
  install -Dm755 "${srcdir}/${_pkgdownload}-$CARCH" "${pkgdir}/usr/bin/${_pkgname}"
}
