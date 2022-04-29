# Maintainer: shilka<shilkazx[AT]gmail.com>

pkgname=wedoc-bin
_pkgname=wedoc
provides=('wedoc' 'tencent-document')
pkgver=2.2.34
pkgrel=2
pkgdesc="Tencent Document, like Google Doc to create and collaborate on online documents. 腾讯文档"
arch=('x86_64')
license=('unknown')
url="https://down.qq.com/qqweb/linux_docs/LinuxTencentDocsAmd64.deb"
source=("${_pkgname}-${pkgver}-${arch}.deb::https://down.qq.com/qqweb/linux_docs/LinuxTencentDocsAmd64.deb"
)
sha512sums=('1843a20f753cc62eff5af0d93781e3462a305810a1a2020c929324a6303c1ec68803c34e03d0ddd253aaf27486eccce4b6065f40cf6212eab774b6aa63b4f6f9')

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

