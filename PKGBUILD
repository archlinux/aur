# Maintainer: taotieren <admin@taotieren.com>
# mockitt 墨刀中文版

pkgname=mockitt-cn
pkgver=1.5.2
pkgrel=3
arch=('x86_64')
provides=("mockitt")
conflicts=("mockitt")
pkgdesc="墨刀，让原型设计更简单, modao/mockitt 国内版本(与国际版本账户数据不互通)"
depends=(
    bash
    expat
    dbus
    gcc-libs
    glib2
    glibc)
makedepends=(
    libarchive)
license=('LicenseRef-scancode-commercial-license')
url="https://modao.cc/feature/downloads.html"
options=(!strip !debug)
source=(
    "privacy.txt"
    "tos.txt"
)
source_x86_64=("${pkgname}-${pkgver}.deb::https://cdn-release.modao.cc/desktop/prod-${pkgver}/linux/modao-linux-x64-${pkgver}.deb")
sha256sums=('845ceda2ba76e8dde171e28cf4347591785195fd63f8e1eef3c7b978ecba580a'
            '2cbf3af6aaa6ecc240a719795f00af5f18bf11f21b35a9e381b9fb1f7ec1887c')
sha256sums_x86_64=('9ee164dd351ba1e4722d2554621608dc46245fbbda3cd5d75b0799f0d0ab9812')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" --numeric-owner -C ${pkgdir}
    chown -R root:root ${pkgdir}
    install -Dm644 ${srcdir}/privacy.txt -t ${pkgdir}/usr/share/licenses/mockitt-cn/
    install -Dm644 ${srcdir}/tos.txt -t ${pkgdir}/usr/share/licenses/mockitt-cn/
}
