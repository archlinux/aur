# Maintainer: wangyifan <wangyifan@acoinfo.com>
#  * Copyright (c) 2023 ACOINFO Team.
#  * All rights reserved.

_pkgname=armory
pkgname="${_pkgname}"-cli
pkgver=1.7.2
pkgrel=1
pkgdesc="ARMORY 是翼辉信息自主研发的软件包管理工具."
arch=('x86_64' 'aarch64')
url="http://10.7.1.31:3001"
license=('custom')
options=(!strip !debug)
depends=('glibc')
provides=('armory')
_srcname="${_pkgname}-v${pkgver}"
source_x86_64=("${_srcname}-x86_64.tar.gz::${url}/v1/packages/@${_pkgname}/${pkgname}/v/${pkgver}/p/Linux/a/x86-64")
source_aarch64=("${_srcname}-aarch64.tar.gz::${url}/v1/packages/@${_pkgname}/${pkgname}/v/${pkgver}/p/Linux/a/aarch64")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {

    tar zxvf ${srcdir}/${_pkgname}-v${pkgver}-*.tar.gz
    install -Dm755 ${srcdir}/${_pkgname} "${pkgdir}/opt/${pkgname}/${_pkgname}"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

