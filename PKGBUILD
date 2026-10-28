# Maintainer: taotieren <admin@taotieren.com>
# mockitt 墨刀中文版

pkgname=mockitt-cn
pkgver=1.6.6
pkgrel=1
arch=('x86_64')
provides=("mockitt")
conflicts=("mockitt")
pkgdesc="墨刀，让原型设计更简单, modao/mockitt 国内版本(与国际版本账户数据不互通)"
depends=(
    bash
    expat
    dbus
    glib2
    libgcc_s.so
    libstdc++.so
)
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
sha256sums_x86_64=('00f090c736b2a08239c3e99962c88487435f14e2ca818ff390697bb27b919135')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" --numeric-owner -C ${pkgdir}
    chown -R root:root ${pkgdir}
    install -Dm644 ${srcdir}/privacy.txt -t ${pkgdir}/usr/share/licenses/mockitt-cn/
    install -Dm644 ${srcdir}/tos.txt -t ${pkgdir}/usr/share/licenses/mockitt-cn/
}
