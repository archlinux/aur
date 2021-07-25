# Maintainer: zhullyb <zhullyb [at] outlook dot com>

pkgname=com.alibabainc.dingtalk
pkgver=0.9.0.172
pkgrel=1
pkgdesc="钉钉"
arch=("x86_64")
url="https://gov.dingtalk.com"
license=("custom")
depends=()
options=()
provides=('dingtalk')
source=("file://com.alibabainc.dingtalk_${pkgver}_amd64.deb"   # get it yourself
        "com.alibabainc.dingtalk.desktop")
md5sums=('7c78e61cdc2fef4b5f8e4953c3229f28'
         '141c17a74d15349583ce3f78034cacf8')

prepare(){
    cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
}

package(){
    cd ${srcdir}

    mkdir -p ${pkgdir}/opt/apps/com.alibabainc.dingtalk/files
    mv opt/apps/com.alibabainc.dingtalk/files/* ${pkgdir}/opt/apps/com.alibabainc.dingtalk/files

    mkdir -p ${pkgdir}/usr/bin
    ln -s /opt/apps/com.alibabainc.dingtalk/files/Elevator.sh ${pkgdir}/usr/bin/dingtalk

    install -Dm644 com.alibabainc.dingtalk.desktop -t ${pkgdir}/usr/share/applications/

    rm ${pkgdir}/opt/apps/com.alibabainc.dingtalk/files/*/libm.so.6
}
