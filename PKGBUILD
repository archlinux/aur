# Maintainer: shilka<shilkazx[AT]gmail.com>

pkgname=wedoc-bin
_pkgname=wedoc
provides=('wedoc' 'tencent-document')
pkgver=2.4.1
pkgrel=1
pkgdesc="Tencent Document, like Google Doc to create and collaborate on online documents. 腾讯文档"
arch=('x86_64')
license=('unknown')
url="https://down.qq.com/qqweb/linux_docs/LinuxTencentDocsAmd64.deb"
source=("${_pkgname}-${pkgver}-${arch}.deb::https://down.qq.com/qqweb/linux_docs/LinuxTencentDocsAmd64.deb")
sha512sums=('070ac74222ecfb80822ddd8cbe0281c3ae02c9290001f77ffbe0d6e9d30579ce0b13419b3e15bcc2004842996eaae8384b66b3b75294e7a01e1d9d2fd3b5192d')
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

