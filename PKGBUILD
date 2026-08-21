# Maintainer: solxix

pkgname=minecrauth-bin
_name=${pkgname%-bin}
_package="achetronic/minecrauth"
pkgver=0.2.0
pkgrel=1
pkgdesc="A self-hosted Yggdrasil authentication server for Minecraft Java Edition with skins and capes."
arch=('x86_64' 'aarch64')
url="https://github.com/${_package}"
license=('Apache-2.0')
#depends=('')
#optdepends=('')
source_x86_64=("${_name}-${pkgver}_x86_64.tar.gz::${url}/releases/download/v${pkgver}/minecrauth_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_name}-${pkgver}_aarch64.tar.gz::${url}/releases/download/v${pkgver}/minecrauth_${pkgver}_linux_arm64.tar.gz")
source=("${_name}-${pkgver}-config.example.yaml::https://raw.githubusercontent.com/${_package}/refs/tags/v${pkgver}/config.example.yaml")
b2sums_x86_64=('SKIP')
b2sums_aarch64=('SKIP')
b2sums=('SKIP')
conflicts=('minecrauth')

package() {
    #cd "${_name}-${pkgver}_${CARCH}"
    install -Dm755 "${srcdir}/minecrauth" "${pkgdir}/usr/bin/minecrauth"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm600 "${srcdir}/${_name}-${pkgver}-config.example.yaml" "${pkgdir}/etc/${_name}/config.yaml"
}
