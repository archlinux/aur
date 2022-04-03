# Maintainer: shilka<shilkazx[AT]gmail.com>

pkgname=wedoc-bin
_pkgname=wedoc
provides=('wedoc' 'tencent-document')
pkgver=2.2.34
pkgrel=1
pkgdesc="Tencent Document, like Google Doc to create and collaborate on online documents. 腾讯文档"
arch=('x86_64')
license=('unknown')
url="https://down.qq.com/qqweb/linux_docs/LinuxTencentDocsAmd64.deb"
source=("${_pkgname}-${pkgver}-${arch}.deb::https://down.qq.com/qqweb/linux_docs/LinuxTencentDocsAmd64.deb"
)
sha512sums=('58d1f22921c736fe1d45c8a1c8d01f16445287fb263edd35af82c3683329df72fe564e85bf7c97481ea0b61e1511082e62aac9832c539b0d4547c24090cdde8d')


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

