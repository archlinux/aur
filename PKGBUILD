# Maintainer: yangon99 <yangon99_all@outlook.com>

pkgname=clash-premium-bin
pkgver=2021.02.19
pkgrel=1
pkgdesc="Close-sourced pre-built Clash binary with TUN support"
provides=("clash")
conflicts=("clash" "clash-tun" "clash-dev-git")
arch=("i686" "x86_64" "arm" "armv6h" "armv7h" "aarch64")
url="https://github.com/Dreamacro/clash/releases/tag/premium"
license=("unknown")
depends=("glibc")
install=${pkgname}.install
source=("clash@.service"
        "clash_user.service")
sha512sums=("3d4b599a972caab7238f405d57e8ec74f9d0f51bc2b51f6656305f3a46aecd4d1d5c10a16415c3c158df1e0248f0aad327ddefc168d480c2674cec29602a31a0"
            "c08d9f25b8c7656b72da975c2ab580adfc8834a61c2dfec8296f19b6964460d12cad2100becadb7478cbccffa7c4805dbed80847c2a30075fc9fb31dee60ebe2")
source_i686=("${pkgname}-i686-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-386-${pkgver}.gz")
source_x86_64=("${pkgname}-x86_64-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-${pkgver}.gz")
source_arm=("${pkgname}-arm-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv5-${pkgver}.gz")
source_armv6h=("${pkgname}-armv6h-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv6-${pkgver}.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv7-${pkgver}.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv8-${pkgver}.gz")

sha512sums_i686=('c17f6bcd5b840a1285936e6d0e70c9cef6c9626db3a9a24f3515085f3da51f5bd2d2c26eb831a5b987149d572fa6be8138e501b6384016f88457b2b199a97237')
sha512sums_x86_64=('f419343dc8789ca08cc6564b3d4d85b7856a43f9b4cd2c79489b2b50d5146a7104f31a01839355e90c26188bbdc8542f9833c8f01585731919feeb208143af76')
sha512sums_arm=('fe0b320101ce91e1ec98d236e595235615f01c8afa2217a1c054c3fa6e4cbf69d45bd5009592c52ea5080a08f911992ece6a32bfb01b9e7322fa0487035f9896')
sha512sums_armv6h=('9e1b848112f51c9b3fcf13c8ce1696d584313b8d2fd19dc7f0531d74ffc78469e08e9bb0a653b9354c8a46203d39f889e3a0d2541a19c0cf3decdc612453cb8f')
sha512sums_armv7h=('8ca0b0d00509f19d010800b3012f6a7da9a3c28946c8407063fce54b5c6fa95cb9a47a0871f989ea542bb4b53643ef9d7d9c4e76a189f1f73ff562e62238be47')
sha512sums_aarch64=('3100436bac7f7b03a8901d24d11063358cbcfff2253a75244f1ece9dd46d8b0139bf95873c7279d6d01ca04e19ab7576982ce0ec016b328e000e1ccd376ffdad')

package() {
    cd ${srcdir}
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash"
    install -Dm644 "clash@.service" "${pkgdir}/usr/lib/systemd/system/clash@.service"
    install -Dm644 "clash_user.service" "${pkgdir}/usr/lib/systemd/user/clash.service"
}
