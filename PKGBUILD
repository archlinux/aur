# Maintainer: adiprasetya <fritziekusumaadiprasetya@gmail.com>

pkgname=clash-meta-bin
pkgver=v1.9.0
pkgrel=3
pkgdesc="Clash Meta binary provided by MetaCubeX"
provides=("clash")
conflicts=("clash" "clash-tun" "clash-dev-git" "clash-premium-bin" "clash-premium-tun")
arch=("x86_64")
url="https://github.com/MetaCubeX/Clash.Meta/releases"
license=("unknown")
depends=("glibc")
install=${pkgname}.install
source=("clash@.service"
        "clash_user.service"
        "clash.service")
sha512sums=('3d4b599a972caab7238f405d57e8ec74f9d0f51bc2b51f6656305f3a46aecd4d1d5c10a16415c3c158df1e0248f0aad327ddefc168d480c2674cec29602a31a0'
            'c08d9f25b8c7656b72da975c2ab580adfc8834a61c2dfec8296f19b6964460d12cad2100becadb7478cbccffa7c4805dbed80847c2a30075fc9fb31dee60ebe2'
            'd22cdfd2a9e2b3296071d255deb0f9e3bab98a551150ccdb20bc8e947c3c4dd8a905e414bf4238357c400042cd399cc8bd15ea1eac0eea8ae2a1e1f71be7af55')
sha512sums_x86_64=('df909ba3bc6806792a749dc7e3b8ffb94eccd940b75dc064371e8b0c5a54325b29e6a6dec81fac7062a384e50ae44263ca74c72356ed991d437a536aa884f666')
source_x86_64=("${pkgname}-x86_64-${pkgver}.gz::${url}/download/${pkgver}/Clash.Meta-linux-amd64-${pkgver}-8-g89609cc.gz")


package() {
    cd ${srcdir}
    install -Dm755 "${pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/clash"
    install -Dm644 "clash.service" "${pkgdir}/usr/lib/systemd/system/clash.service"
    install -Dm644 "clash@.service" "${pkgdir}/usr/lib/systemd/system/clash@.service"
    install -Dm644 "clash_user.service" "${pkgdir}/usr/lib/systemd/user/clash.service"
}
