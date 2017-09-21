# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=hackmd-desktop
pkgver=0.0.3
pkgrel=2
pkgdesc="An electron wrapped desktop client for HackMD"
arch=('any')
url="https://github.com/hackmdio/hackmd-desktop"
license=('MIT')
depends=('gtk2' 'gconf' 'libxss' 'nss' 'alsa-lib')
source=(
    "${url}/releases/download/v${pkgver}/hackmd-desktop_${pkgver}_amd64.deb"
)
md5sums=(
    'df4da857f62f57f33b048fc09f7e8f97'
)

package() {
    tar Jxf data.tar.xz

    cp -a ${srcdir}/usr ${pkgdir}/usr
    cp -a ${srcdir}/opt ${pkgdir}/opt

    install -dm755 ${pkgdir}/usr/bin
    ln -sf /opt/HackMD/hackmd-desktop ${pkgdir}/usr/bin/hackmd-desktop
}
