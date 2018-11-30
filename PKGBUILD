# Maintainer: levinit <levinit at outlook>

pkgname=mockingbot
pkgver=0.7.1
pkgrel=1
pkgdesc="A prototyping & collaboration tool.墨刀/modao/MockingBot"
arch=('x86_64')
url="https://mockingbot.com/downloads"
license=('custom')
depends=('gconf')


source=("https://s3.cn-north-1.amazonaws.com.cn/modao/linux/MockingBot_amd64.deb")
sha512sums=('SKIP')

package() {
    tar -xvf data.tar.xz -C ${pkgdir}

    cp -r ${pkgdir}/usr/bin/MockingBot ${pkgdir}/usr/bin/mockingbot

    #edit app's desktop file
    sed -i 's/Exec=MockingBot/Exec=mockingbot/' ${pkgdir}/usr/share/applications/MockingBot.desktop
    sed -i 's/Comment=MockingBot/Comment=Prototyping design tool/' ${pkgdir}/usr/share/applications/MockingBot.desktop
    sed -i 's/Categories=utils;/Categories=Development;Graphics;/' ${pkgdir}/usr/share/applications/MockingBot.desktop
    echo -e '
Name[zh_CN]=墨刀
Name[zh_TW]=墨刀
Name[zh_HK]=墨刀
Name[zh_SG]=墨刀
Comment[zh_CN]=原型设计工具
Comment[zh_TW]=原型設計工具
Comment[zh_HK]=原型設計工具
Comment[zh_SG]=原型设计工具' >> ${pkgdir}/usr/share/applications/MockingBot.desktop

    chmod -R go-w "${pkgdir}"/usr
    install -dm755 "${pkgdir}/usr/bin"
}