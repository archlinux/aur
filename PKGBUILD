# Maintainer: Roman Alenichev (vicimpa@ya.ru)

pkgname=chatroulette
pkgver=0.0.2
pkgrel=2
pkgdesc="ChatRoulette desktop client whithout blocking virtual camera."
arch=('x86_64')
url="https://github.com/vicimpa/chatroulette"
license=('custom')
depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3' 'libegl' 'libgles')
optdepends=('gnome-keyring')
source=("chatroulette-${pkgver}-${pkgrel}.tar.gz::https://github.com/vicimpa/chatroulette/releases/download/0.0.2/ChatRoulette-linux-0.0.2.tar.gz")
sha256sums=('1ae590cb6e11581de37870b242ccaf59a0c14f9cfb8829aedf428530dd834524')

package() {
    mkdir -p "${pkgdir}/usr/lib/chatroulette"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/pixmaps"

    mv "${srcdir}/"* "${pkgdir}/usr/lib/chatroulette"

    cp "${startdir}/chatroulette.desktop" "${pkgdir}/usr/share/applications"
    cp "${startdir}/icon.png" "${pkgdir}/usr/share/pixmaps/chatroulette.png"

    chmod +x "${pkgdir}/usr/lib/chatroulette/ChatRoulette"
}
