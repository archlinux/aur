pkgname=todesk
pkgver=4.1.0
pkgrel=1
pkgdesc="ToDesk 不一样的远程连接体验"
arch=('x86_64')
url="https://www.todesk.com/"
license=('custom')
provides=('todesk')
conflicts=('todesk' 'todesk-bin')
image="todesk.pkg.tar.zst"
source=("${image}::https://newdl.todesk.com/linux/todesk_4.1.0_x86_64.pkg.tar.zst") 
md5sums=('62996717cf85b3d4eed3cec064115709')
options=(!strip)

prepare(){
    bsdtar -xf "${srcdir}/${image}";
}

package(){
    mv "${srcdir}/etc" "${pkgdir}"
    mv "${srcdir}/opt" "${pkgdir}"
    mv "${srcdir}/usr" "${pkgdir}"
}
