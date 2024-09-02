## Author: shamela team <shamela.ws>
# Maintainer: dj.zak <dz.wbdev@gmail.com>
pkgname=shamela
pkgver=4
pkgrel=3
pkgdesc="المكتبة الشاملة، A digital library which enables you to download, read and search arabic books."
arch=('x86_64')
url="https://shamela.ws/page/download"
license=('custom')
depends=('wine' 'winetricks' 'bash')
source=('shamela4.tar.xz::https://archive.org/download/shamela4.tar/shamela4.tar.xz')
sha256sums=('f0dc9456e84682174949cd5d157e30517b1918a44e33fbebc50d7b1e16356aad')

package() {
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mv "${srcdir}/shamela4/"* "${pkgdir}/usr/share/${pkgname}/"
    find "$pkgdir"/usr/share -type f -exec chmod 644 "{}" \;
    find "$pkgdir"/usr/share -type d -exec chmod 755 "{}" \;
    install -Dm755 "${srcdir}/shamela.sh" "${pkgdir}/usr/bin/shamela.sh"
    install -Dm644 "${srcdir}/shamela.desktop" "${pkgdir}/usr/share/applications/shamela.desktop"
    }
