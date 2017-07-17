# Maintainer: levinit <levinit at outlook>

pkgname=mockingbot
pkgver=0.5.1
pkgrel=1
pkgdesc="A prototyping & collaboration tool.墨刀/modao/MockingBot"
arch=('i686' 'x86_64')
url="https://modao.cc/downloads"
license=('custom')
depends=('gconf')

source_common="https://s3.cn-north-1.amazonaws.com.cn/modao/downloads"
source_x86_64=("$source_common/MockingBot_amd64.deb")
source_i686=("$source_common/MockingBot_i386.deb")

md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')

package() {
    tar -xvf data.tar.xz -C ${pkgdir}
    mv ${pkgdir}/usr/bin/MockingBot ${pkgdir}/usr/bin/mockingbot
    sed -i 's/Exec=MockingBot/Exec=mockingbot/' ${pkgdir}/usr/share/applications/MockingBot.desktop
    chmod -R go-w "${pkgdir}"/usr
    install -dm755 "${pkgdir}/usr/bin"
}
