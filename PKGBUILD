# Maintainer: mark dot blakeney at bullet-systems dot net
# Contributor: Danilo Kuehn <dk[at]nogo-software[dot]de>
_pkgname=dry
pkgname=$_pkgname-bin
pkgver=0.12.2
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
sha256sums_x86_64=('01b1407a519d1ad6f5a77bb97da3cdd5702877e65f25855d233eaa1162ee27d1')
sha256sums_i686=('b4db92948af4e2ad2a400f7150b7333a1bf73ce9781fcb0590de0c2807f1e3f4')
sha256sums_armv7h=('947a0264bc94811f0453ed03ff851555afef12c2b60e0150a631f28f8c8f228d')
sha256sums_aarch64=('11a362fc12808abccaa376cba6fadf1d43b8222a15fe8e3857d1ba991e24c991')

package() {
  install -Dm755 "${srcdir}/${_pkgdownload}-$CARCH" "${pkgdir}/usr/bin/${_pkgname}"
}
