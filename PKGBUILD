# Maintainer: shilka<shilkazx[AT]gmail.com>

pkgname=wedoc-bin
_pkgname=wedoc
provides=('wedoc' 'tencent-document')
pkgver=2.3.16
pkgrel=1
pkgdesc="Tencent Document, like Google Doc to create and collaborate on online documents. 腾讯文档"
arch=('x86_64')
license=('unknown')
url="https://down.qq.com/qqweb/linux_docs/LinuxTencentDocsAmd64.deb"
source=("${_pkgname}-${pkgver}-${arch}.deb::https://down.qq.com/qqweb/linux_docs/LinuxTencentDocsAmd64.deb")
sha512sums=('9e2b847b90f2138c189beaebc7a37037b634fcd4f88e2c649c62d73fb19c8ad568b02905387b8aae39fdb3f750dd8dbd862240c82407fd9c40f9e9b7b3778d9b')
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

