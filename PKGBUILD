# Maintainer: MYT1 <MYT1 @ QQ .com>
pkgname=libnss-wrapper-bin
_pkgname=$pkgname%-bin
pkgver=1.1.16
pkgrel=1
pkgdesc='网易邮箱libnss-wrapper-bin依赖打包'
arch=('x86_64')
url="http://cwrap.org/nss_wrapper.html"
license=('custom')
depends=(
    'glibc')
source=(
    "http://ftp.us.debian.org/debian/pool/main/n/nss-wrapper/libnss-wrapper_1.1.16-1_amd64.deb"
)
sha256sums=('7f1c57d82bf64e31cc5bbd2e254a460c1236ce19f847fd0079839f28ae390ad9')

package() {
    bsdtar -xf "${srcdir}/data."*
    install -m755 -d "${pkgdir}/usr/lib"
    mv "${srcdir}/usr/share" "${pkgdir}/usr" 
    cd ${srcdir}/usr/lib/x86_64-linux-gnu
    cp -r * "${pkgdir}/usr/lib"  
}
