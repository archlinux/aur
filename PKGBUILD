# Maintainer: Rudolf Schmidt <info@rudolfschmidt.com>
pkgname=simplex-desktop
pkgver=6.5.0
pkgrel=1
pkgdesc="The first messaging platform that has no user identifiers — desktop GUI client"
arch=('x86_64')
url="https://simplex.chat"
license=('AGPL-3.0-only')
depends=('java-runtime>=17' 'gtk3' 'libsecret')
provides=('simplex-desktop')
conflicts=('simplex-desktop-bin')
source=("simplex-desktop-${pkgver}.deb::https://github.com/simplex-chat/simplex-chat/releases/download/v${pkgver}/simplex-desktop-ubuntu-22_04-x86_64.deb")
sha256sums=('066942b3ae457e141854499280b6d7a816a3dabb930a054d11397341e4c4ed55')

package() {
    cd "${srcdir}"
    tar --zstd -xf data.tar.zst -C "${pkgdir}"

    install -d "${pkgdir}/usr/share/applications"
    ln -s /opt/simplex/lib/simplex-simplex.desktop "${pkgdir}/usr/share/applications/simplex.desktop"

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/simplex/bin/simplex "${pkgdir}/usr/bin/simplex-desktop"
}
