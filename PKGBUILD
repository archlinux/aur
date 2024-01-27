# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=natapp
pkgver=2_4_0
pkgrel=1
pkgdesc="High speed intranet penetration tools in Chinese based on ngrok."
arch=("x86_64" "aarch64" "armv7h")
url="https://natapp.cn"
license=('custom')
source=("LICENSE::https://natapp.cn/article/serviceagreement")
source_x86_64=(
    "${pkgname}_${pkgver}_${arch[0]}::https://cdn.natapp.cn/assets/downloads/clients/${pkgver}/${pkgname}_linux_amd64/${pkgname}"
)
source_aarch64=(
    "${pkgname}_${pkgver}_${arch[1]}::https://cdn.natapp.cn/assets/downloads/clients/${pkgver}/${pkgname}_linux_arm64/${pkgname}"
)
source_armv7h=(
    "${pkgname}_${pkgver}_${arch[2]}::https://cdn.natapp.cn/assets/downloads/clients/${pkgver}/${pkgname}_linux_arm/${pkgname}"
)

md5sums=('6ae2f443e1902be706a9d370feb6571e')
md5sums_x86_64=('a2dabdc2577486d250b8197499478333')
md5sums_aarch64=('8b988a68216c45c97e8f184566999368')
md5sums_armv7h=('3290182ed7172db14f69f6ddad92c4ff')

package() {
  cd ${srcdir}
  
  install -Dm755 ${pkgname}_${pkgver}_${CARCH} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
# vim:set sw=2 ts=2 et:
