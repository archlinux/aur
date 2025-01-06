# Maintainer: MYT1 <MYT1 @ QQ .com>
pkgname=additional-base-lib
pkgver=2.40
epoch=2
pkgrel=3
pkgdesc='Additional Base Lib 附加基础库，用轻量级容器工具bubblewrap解决GNU/Linux操作系统中常见的glibc不兼容问题。'
arch=('x86_64')
url="https://gitee.com/deepin-community-store/additional-base-lib"
license=('custom')
depends=(
    'bubblewrap'
    'bash'
    'coreutils'
    'glibc'
    'gcc-libs'
    )
options=('!strip' '!debug')
source=(
    "ablrun"
)
package() {
    install -m755 -d "${pkgdir}/usr/lib"
    install -m755 -d "${pkgdir}/usr/lib/additional-base-lib/gconv"
    cp -r "/usr/lib/gconv" "${pkgdir}/usr/lib/additional-base-lib"
    install -m755 -d "${pkgdir}/usr/lib/additional-base-lib/lib64"
    cp -r "/usr/lib/ld-linux-x86-64.so.2" "${pkgdir}/usr/lib/additional-base-lib/lib64"
    cp -r "/usr/bin/ldd" "${pkgdir}/usr/lib/additional-base-lib" 
    cp -r "/usr/lib/ld-linux-x86-64.so.2" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libanl.so.1" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libBrokenLocale.so.1" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libc.so.6" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libc_malloc_debug.so.0" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libdl.so.2" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libm.so.6" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libmemusage.so" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libmvec.so.1" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libnsl.so.1" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libnss_compat.so.2" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libnss_dns.so.2" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libnss_files.so.2" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libnss_hesiod.so.2" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libpcprofile.so" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libpthread.so.0" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libresolv.so.2" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/librt.so.1" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libstdc++.so.6.0.33" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libthread_db.so.1" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libutil.so.1" "${pkgdir}/usr/lib/additional-base-lib"
    cp -r "/usr/lib/libsasl2.so.3.0.0" "${pkgdir}/usr/lib/additional-base-lib"
    install -Dm755 ablrun "${pkgdir}/usr/bin/ablrun"  
    cd "${pkgdir}/usr/lib/additional-base-lib"
    ln -s libsasl2.so.3.0.0 "${pkgdir}/usr/lib/additional-base-lib/libsasl2.so.2"
    ln -s libstdc++.so.6.0.33 "${pkgdir}/usr/lib/additional-base-lib/libstdc++.so.6"
    ln -s libanl.so.1 "${pkgdir}/usr/lib/additional-base-lib/libanl.so"
}
sha256sums=('d29b3b70b242d2da014bca5eebddfe5cf6291cf728f5f019fdafe5f8a65a37ec')
