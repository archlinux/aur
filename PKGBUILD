# Maintainer: Roman Alenichev (vicimpa@ya.ru)

pkgname=chatroulette
pkgver=0.0.1
pkgrel=1
pkgdesc="ChatRullete"
arch=('x86_64')
url="https://github.com/vicimpa/chatrullete-plus"
license=('custom')
depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3' 'opera-ffmpeg-codecs' 'libegl' 'libgles')
optdepends=('gnome-keyring')
source=("chatrullete-${pkgver}-${pkgrel}.tar.gz::https://github.com/vicimpa/chatroulette/releases/download/0.0.1/ChatRullete-linux-0.0.1.tar.gz")
sha256sums=('a166184a809fe48df21d66371b005e2bd9017ed54e8c86ac0734b56728d7d29b')

package() {
    mkdir -p "${pkgdir}/usr/lib/chatrullete"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/pixmaps"

    mv "${srcdir}/"* "${pkgdir}/usr/lib/chatrullete"
    mv "${pkgdir}/usr/lib/chatrullete/ChatRullete" "${pkgdir}/usr/lib/chatrullete/chatrullete"

    cp "${startdir}/chatrullete.desktop" "${pkgdir}/usr/share/applications"
    cp "${startdir}/icon.png" "${pkgdir}/usr/share/pixmaps/chatrullete.png"

    chmod +x "${pkgdir}/usr/lib/chatrullete/chatrullete"
}