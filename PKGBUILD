# Maintainer: levinit <levinit at outlook>

pkgname=mockitt
pkgver=1.2.5
pkgrel=1
pkgdesc="A prototyping & collaboration tool.墨刀/modao/mockitt"
arch=('x86_64')
url="https://mockitt.com/downloads"
license=('custom')
#depends=('')
source=("https://cdn-release.modao.cc/desktop/mockitt_${pkgver}_amd64.deb")

md5sums=('4815b13965c969e561975f61fdfb60d8')

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
Comment[zh_SG]=原型设计工具' >>${pkgdir}/usr/share/applications/mockitt.desktop

    chmod -R go-w "${pkgdir}"/usr
    install -dm755 "${pkgdir}/usr/bin"
}
