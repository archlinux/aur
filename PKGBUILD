# Maintainer: yangon99 <yangon99_all@outlook.com>

pkgname=clash-premium-bin
pkgver=2022.04.11
pkgrel=2
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
sha512sums=('3d4b599a972caab7238f405d57e8ec74f9d0f51bc2b51f6656305f3a46aecd4d1d5c10a16415c3c158df1e0248f0aad327ddefc168d480c2674cec29602a31a0'
            'c08d9f25b8c7656b72da975c2ab580adfc8834a61c2dfec8296f19b6964460d12cad2100becadb7478cbccffa7c4805dbed80847c2a30075fc9fb31dee60ebe2')
sha512sums_i686=('51a05947f8dd3119c4e7112e53f613ad5060385b4792f00f032866c2ce6927eb802b0595287c3049fedb68b17a927a0a4c487b033ca7cb991443bc4011496d2a')
sha512sums_x86_64=('866ec4c0cdaab3fdb29398e6e217a2df838604fd0587a4586e569e2ffa3b4250e0ab6acf6929b6b1b7860fe59935281f5a49c4ca030550899b815ea5537add48')
sha512sums_arm=('2b9d225c6df3e66ec6eddc6ae09345bb6a277711bc4fe6f8b4e9a71732f525f744285da88741c2ca0371f37a6f7237870b48874c3ab997d515db7dbfa5943fe8')
sha512sums_armv6h=('8561f523274e6c185ba93596a6bd377025658fb41778935a0b8b844698bab714c848fd75ec37009675547e68b19c067bc4a26c07df87606051979d4bbf3b7fb9')
sha512sums_armv7h=('de6e5a6f772c56627003ac9a59a180defc1a87f9161f01bd4017fcca2a2f08fe0a00561a4e902c31f2c42f466ea6c3f96c858ae7decdb7f805ae0b2c41002a74')
sha512sums_aarch64=('7f301f577a21a92560c9f4e2bf2640a0eca565aee645fb4532eb98553db7fc585bde62f6ff289ecdbb44b01ec402bb0e82de9685a2706b85230626595e56529b')
source_i686=("${pkgname}-i686-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-386-${pkgver}.gz")
source_x86_64=("${pkgname}-x86_64-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-amd64-${pkgver}.gz")
source_arm=("${pkgname}-arm-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv5-${pkgver}.gz")
source_armv6h=("${pkgname}-armv6h-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv6-${pkgver}.gz")
source_armv7h=("${pkgname}-armv7h-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv7-${pkgver}.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.gz::https://github.com/Dreamacro/clash/releases/download/premium/clash-linux-armv8-${pkgver}.gz")


package() {
    cd ${srcdir}
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash"
    install -Dm644 "clash@.service" "${pkgdir}/usr/lib/systemd/system/clash@.service"
    install -Dm644 "clash_user.service" "${pkgdir}/usr/lib/systemd/user/clash.service"
}
