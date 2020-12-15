# Maintainer: Auroot <2763833502@qq.com>
pkgname='auin'
pkgver=v4.0.5
pkgrel=1
arch=('any')
url="https://www.auroot.cn/"
pkgdesc="Archlinux system installation script."
license=('GPL3')
_mirror="https://www.auroot.cn"
source=("$_mirror/shell/$pkgname-$pkgver.tar.gz")
md5sums=('42f6f1a5ebb8d9fad4fc2f97232a4843')
build(){
    msg "Extracting DPKG package ..."
    mkdir -p "${srcdir}/"
    tar zxf $pkgname-$pkgver.tar.gz -C "${srcdir}/"
}
package() {
    mkdir -p "${HOME}/.auin"
    install -d "${pkgdir}/usr/bin/"
    cp -a ${srcdir}/auin/$pkgname-$pkgver/* "${HOME}/.auin/"
    install -m775 "${srcdir}/$pkgname-$pkgver/auin.sh" "${HOME}/.auin/"
    msg "Create a link to the executable file ...."
    ln -sf "${HOME}/.auin/auin.sh" "${pkgdir}/usr/bin/auin"
}
