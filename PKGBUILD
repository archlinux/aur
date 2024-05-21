# Maintainer: wangyifan <wangyifan@acoinfo.com>
#  * Copyright (c) 2023 ACOINFO Team.
#  * All rights reserved.

_pkgname=armory
pkgname="${_pkgname}"-cli
pkgver=1.5.1
pkgrel=1
pkgdesc="ARMORY 是翼辉信息自主研发的软件包管理工具."
arch=('x86_64' 'aarch64')
url="http://10.7.1.31:3001"
license=('custom')
options=(!strip !debug)
depends=('glibc')
provides=('armory')
_srcname="${_pkgname}-v${pkgver}-${CARCH}"
source=("${_srcname}.tar.gz::${url}/v1/packages/@${_pkgname}/${pkgname}/v/${pkgver}/p/Linux/a/${CARCH}")
sha256sums=('SKIP')

package() {
    # AppImage
    install -Dm755 ${srcdir}/${_pkgname}-v${pkgver}-linux* "${pkgdir}/opt/${pkgname}/${_pkgname}-v${pkgver}-linux-${CARCH}"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_pkgname}-v${pkgver}-linux-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
}

