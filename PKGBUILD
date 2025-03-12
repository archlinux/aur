# Maintainer: taotieren <admin@taotieren.com>
# mockitt 中文版

pkgname=mockitt-cn
pkgver=1.5.0
pkgrel=4
arch=('x86_64')
options=(!strip !debug)
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
license=('LicenseRef-Commercial')
url="https://modao.cc/feature/downloads.html"
# https://cdn-release.modao.cc/desktop/prod-1.5.0/linux/modao-linux-x64-1.5.0.deb
source_x86_64=("${pkgname}-${pkgver}.deb::https://cdn-release.modao.cc/desktop/prod-${pkgver}/linux/modao-linux-x64-${pkgver}.deb")
sha256sums_x86_64=('b8641d8b8e895e1ec31d65ebbd58ede809346a33adeea7a63453c95442e828ca')

package() {
    bsdtar -xf "${srcdir}/data.tar.xz" --numeric-owner -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
