# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=natapp
pkgver=2.5.0
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="High speed intranet penetration tools in Chinese based on ngrok."
arch=("x86_64" "aarch64" "armv7h")
url="https://natapp.cn"
license=('custom')
source=("LICENSE::https://natapp.cn/article/serviceagreement")
source_x86_64=(
    "${pkgname}_${_pkgver}_${arch[0]}::https://download.natapp.cn/assets/downloads/clients/${_pkgver}/${pkgname}_linux_amd64/${pkgname}"
)
source_aarch64=(
    "${pkgname}_${_pkgver}_${arch[1]}::https://download.natapp.cn/assets/downloads/clients/${_pkgver}/${pkgname}_linux_arm64/${pkgname}"
)
source_armv7h=(
    "${pkgname}_${_pkgver}_${arch[2]}::https://download.natapp.cn/assets/downloads/clients/${_pkgver}/${pkgname}_linux_arm/${pkgname}"
)

md5sums=('6ae2f443e1902be706a9d370feb6571e')
md5sums_x86_64=('da57634fec6d2973a469fbeb594859b3')
md5sums_aarch64=('65f6577b517ee5794607817445c0bffe')
md5sums_armv7h=('b871f4ebe0c15f898ee76a539586181a')

package() {
  cd ${srcdir}
  
  install -Dm755 ${pkgname}_${_pkgver}_${CARCH} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set sw=2 ts=2 et:
