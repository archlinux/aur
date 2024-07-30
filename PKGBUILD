# Maintainer: wangyifan <wangyifan@acoinfo.com>
#  * Copyright (c) 2024 ACOINFO Team.
#  * All rights reserved.

pkgname=cmake-sylixos-plugins
pkgver=1.0.0
pkgrel=1
pkgdesc="翼辉信息sylixos系统的cmake编译链配置."
arch=('any')
license=('custom')
options=(!strip !debug)
depends=('cmake')
source=(SylixOS.cmake
        SylixOS-GNU.cmake
        SylixOS-GNU-C.cmake
        SylixOS-GNU-CXX.cmake
        SylixOS-GNU-Fortran.cmake)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    for plugin in SylixOS.cmake SylixOS-GNU.cmake SylixOS-GNU-C.cmake SylixOS-GNU-CXX.cmake SylixOS-GNU-Fortran.cmake;do
            install -Dm644 "${srcdir}/${plugin}" "${pkgdir}/usr/share/cmake/Modules/Platform/${plugin}"
    done
}
