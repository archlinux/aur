# Maintainer: levinit <levinit at outlook>

pkgname=iceworks
pkgver=1.4.0
pkgrel=1
pkgdesc="icework make front-end engineering becomes easy and convenient.飞冰，让前端工程变得轻松便捷。"
arch=('x86_64')
url="https://mockingbot.com/downloads"
license=('MIT')
depends=()

source=("https://iceworks-beta.oss-cn-hangzhou.aliyuncs.com/linux/Iceworks-amd64-1.4.0-beta.deb")
md5sums=('SKIP')

package() {
    tar -xvf data.tar.xz -C ${pkgdir}

    #edit app's desktop file
    sed -i '/Comment/d'  ${pkgdir}/usr/share/applications/iceworks-desktop.desktop
    echo -e '
Name[zh_CN]=飞冰
Name[zh_TW]=飛冰
Name[zh_HK]=飛冰
Comment=icework make front-end engineering becomes easy and convenient
Comment[zh_CN]=飞冰 让前端工程变得轻松便捷
Comment[zh_TW]=飛冰 讓前端工程變得輕鬆便捷
Comment[zh_HK]=飛冰 讓前端工程變得輕鬆便捷' >> ${pkgdir}/usr/share/applications/iceworks-desktop.desktop

    chmod -R go-w "${pkgdir}"/usr
    install -dm755 "${pkgdir}/usr/bin"
}
