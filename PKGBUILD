# Maintainer: Auroot <2763833502@qq.com>
pkgname='auin'
pkgver=v4.0.5
pkgrel=2
arch=('any')
url="https://www.auroot.cn/"
pkgdesc="Archlinux system installation script."
license=('GPL3')
_mirror="https://gitee.com/auroot/Arch_install/attach_files"
source=("$_mirror/552104/download/$pkgname-$pkgver.tar.gz")
md5sums=('7a13530a621e45f9b758fb00147b91ef')
build(){
    msg "Extracting DPKG package ..."
    mkdir -p "${srcdir}/"
}
package() {
    mkdir -p "${HOME}/.auin"
    install -d "${pkgdir}/usr/bin/"
    rm ${srcdir}/$pkgname-$pkgver.tar.gz
    cp -a ${srcdir}/* "${HOME}/.auin/"
    install -m775 "${srcdir}/auin" "${HOME}/.auin/"
    msg "Create a link to the executable file ...."
    ln -sf "${HOME}/.auin/auin" "${pkgdir}/usr/bin/auin"
}
