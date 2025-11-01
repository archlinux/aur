# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=natapp
pkgver=2.4.2
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

md5sums=('SKIP')
md5sums_x86_64=('3648bf8bf64530e4b406be7a0a570092')
md5sums_aarch64=('e6f98bfb01383a70cefebb943f38e8f7')
md5sums_armv7h=('01b7813a5e1d3369d5ba3214099f6a28')

package() {
  cd ${srcdir}
  
  install -Dm755 ${pkgname}_${_pkgver}_${CARCH} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set sw=2 ts=2 et:
