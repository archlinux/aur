## Author: shamela team <shamela.ws>
# Maintainer: dj.zak <dz.wbdev@gmail.com>
pkgname=shamela
pkgver=4
pkgrel=2
pkgdesc="A digital library which enables you to download, read and search arabic books."
arch=('x86_64')
url="https://shamela.ws/page/download"
license=('custom')
depends=('wine' 'winetricks' 'bash')
source=('shamela4.tar.xz::https://archive.org/download/shamela4.tar/shamela4.tar.xz'
'https://archive.org/download/shamela4.tar/shamela.sh'
'https://archive.org/download/shamela4.tar/shamela.desktop')
sha256sums=('827daf992b8de01c1958f25f291f55264395aea84f798bf65fd3e1d12c0e11e4'
'9d777d527816217228728e6a0a8214330e1149b8fd56602d33f191d6440f4f13'
'b29e5cf0b4e0ca41e4e43c734aa10d479dfc6dcc49f9fdaa4e375800dbe50caa')

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mv "${srcdir}/shamela4/"* "${pkgdir}/usr/share/${pkgname}/"
    find "$pkgdir"/usr/share -type f -exec chmod 644 "{}" \;
    find "$pkgdir"/usr/share -type d -exec chmod 755 "{}" \;
    install -Dm755 "${srcdir}/shamela.sh" "${pkgdir}/usr/bin/shamela.sh"
    install -Dm644 "${srcdir}/shamela.desktop" "${pkgdir}/usr/share/applications/shamela.desktop"
    }
