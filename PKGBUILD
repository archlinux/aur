# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=hackmd-desktop
pkgver=0.1.0
pkgrel=1
pkgdesc="An electron wrapped desktop client for HackMD"
arch=('any')
url="https://github.com/hackmdio/hackmd-desktop"
license=('MIT')
depends=('gtk2' 'gconf' 'libxss' 'nss' 'alsa-lib')
source=(
    "${url}/releases/download/v${pkgver}/hackmd-desktop_${pkgver}_amd64.deb"
)
md5sums=('49057098eb60ad3796b99bb5dc62b8d8')

package() {
    tar Jxf data.tar.xz

    cp -a ${srcdir}/usr ${pkgdir}/usr
    cp -a ${srcdir}/opt ${pkgdir}/opt

    install -dm755 ${pkgdir}/usr/bin
    ln -sf /opt/HackMD/hackmd-desktop ${pkgdir}/usr/bin/hackmd-desktop
}
