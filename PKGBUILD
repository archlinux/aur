# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=natapp
pkgver=3.0.1
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

md5sums=('83d16137b2412bcab8072d252ffadc8d')
md5sums_x86_64=('212d2ca35359a5c0f450c12214e67f74')
md5sums_aarch64=('6bd88c1ed5cc94f279f746f78cca001a')
md5sums_armv7h=('0cca182a873162bde8e686f3f46ea2c9')

package() {
  cd ${srcdir}
  
  install -Dm755 ${pkgname}_${_pkgver}_${CARCH} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set sw=2 ts=2 et:
