# Maintainer: levinit <levinit at outlook>

pkgname=mockingbot
pkgver=1.1.9
pkgrel=1
pkgdesc="A prototyping & collaboration tool.墨刀/modao/MockingBot"
arch=('x86_64')
url="https://mockingbot.com/downloads"
license=('custom')
#depends=('')

source=("https://cdn.modao.cc/mockitt_${pkgver}_amd64.deb")
sha512sums=('957ad44f56779da35242d51956b53605faa3d65f67a8772118e36ad6ed6e1a47bbd864986a3f4fe18e37a290f7991d71a99f9cb94ba61bf9f9405207f0002b91')

package() {
    tar -xvf data.tar.xz -C ${pkgdir}

    #edit app's desktop file
    echo -e '
Name[zh_CN]=墨刀
Name[zh_TW]=墨刀
Name[zh_HK]=墨刀
Name[zh_SG]=墨刀
Comment[zh_CN]=原型设计工具
Comment[zh_TW]=原型設計工具
Comment[zh_HK]=原型設計工具
Comment[zh_SG]=原型设计工具' >>${pkgdir}/usr/share/applications/mockingbot.desktop

    chmod -R go-w "${pkgdir}"/usr
    install -dm755 "${pkgdir}/usr/bin"
}
