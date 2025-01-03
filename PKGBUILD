# Maintainer: MYT1 <MYT1 @ QQ .com>
pkgname=additional-base-lib-bin
_pkgname=$pkgname%-bin
pkgver=2.40
pkgrel=2
pkgdesc='网易邮箱additional-base-lib-bin依赖打包'
arch=('x86_64')
url="https://gitee.com/deepin-community-store/additional-base-lib"
license=('custom')
depends=(
    'bubblewrap'
    'bash'
    'coreutils'
    )
source=(
    "https://mirrors.sdu.edu.cn/spark-store-repository/amd64-store/tools/additional-base-lib/additional-base-lib_2.40-4-9_amd64.deb"
)
sha256sums=('51c6361402734f7bd08cc8a74895d650e56c3d5e093850adea8bf125df29c7c9')

package() {
    bsdtar -xf "${srcdir}/data."*
    sed '3s/.*/ABL_DIR_PREFIX=lib/g' -i "${srcdir}/usr/bin/ablrun"
    install -m755 -d "${pkgdir}/usr/lib"
    cp -r "${srcdir}/usr/lib/x86_64-linux-gnu/additional-base-lib" "${pkgdir}/usr/lib" 
    install -Dm755 ${srcdir}/usr/bin/ablrun "${pkgdir}/usr/bin/ablrun"  
}
