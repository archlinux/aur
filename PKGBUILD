# Maintainer: ylxdzsw <ylxdzsw@gmail.com>

pkgname=eliza-bin
pkgdesc='Eliza the novel game by Zachtronics.'
pkgver=2019.09.03
pkgrel=1
url='http://www.zachtronics.com/eliza/'
arch=(i686 x86_64)
license=(custom)
source=(
    local://Eliza_DRM-Free_Build_Linux_09.03.2019.zip
    Eliza.desktop
)
md5sums=(5aacadfcd9735fdb2ebaaba0173e4e92 SKIP)

prepare() {
    cd "$srcdir/linux"
    chmod +x Eliza Eliza.bin.x86 Eliza.bin.x86_64
}

package() {
    cd "$srcdir"
    install -Dm644 Eliza.desktop "$pkgdir"/usr/share/applications/Eliza.desktop
    install -Dm644 linux/LICENSE.txt "$pkgdir"/usr/share/licenses/Eliza/LICENSE
    install -d "$pkgdir"/opt/Eliza
    cp -a linux/. "$pkgdir"/opt/Eliza
}
