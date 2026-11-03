# Maintainer: icepie <icepie.dev@gmail.com>
pkgname=coolapk-desktop-bin
_pkgname=coolapk-desktop
pkgver=1.39.3
pkgrel=1
pkgdesc="基于 Tauri 2、Vue 3 和 Rust 的非官方酷安桌面客户端"
arch=('x86_64')
url="https://github.com/coolapk-desktop/coolapk-desktop"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('eefff13381e4336215c401d870ea1ba633e7c7c8b9b160ee0f536a6fd8c8f556'
            '4e1461d7dcd7ae220e7458cf4df8fd4973dd9adcdfeefaba45b9f5e4065979a3')

package() {
    tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
