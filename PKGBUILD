# Maintainer: shilka<shilkazx[AT]gmail.com>

pkgname=wedoc-bin
_pkgname=wedoc
provides=('wedoc' 'tencent-document')
pkgver=2.3.10
pkgrel=1
pkgdesc="Tencent Document, like Google Doc to create and collaborate on online documents. 腾讯文档"
arch=('x86_64')
license=('unknown')
url="https://down.qq.com/qqweb/linux_docs/LinuxTencentDocsAmd64.deb"
source=("${_pkgname}-${pkgver}-${arch}.deb::https://down.qq.com/qqweb/linux_docs/LinuxTencentDocsAmd64.deb")
sha512sums=('dbd824896333ea9be11e93128f0fcc839e8173639a4c2d09ed08f068a402acc8b755be2c053f1321ae3e4fcf3747d044b0f1c3ffc73b3cfeaf30df9589e3335e')
package() {
    tar xpf data.tar.xz -C ${pkgdir}
    cd ${pkgdir}/usr/share/applications
    sed -i '3c Exec=wedoc %u ' tdappdesktop.desktop 

    cd ${pkgdir}/opt
    mv 腾讯文档 ${_pkgname}
    cd ${pkgdir}/opt/${_pkgname}
    chmod a+x ./tdappdesktop
    mkdir -p ${pkgdir}/usr/bin
    ln -sf /opt/${_pkgname}/tdappdesktop ${pkgdir}/usr/bin/wedoc


}

