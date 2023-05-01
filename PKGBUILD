# Maintainer: Felipe Eduardo <felipeeduardopublic@gmail.com>

pkgname=kakele
pkgver=4.4.4
pkgrel=4
pkgdesc="Kakele Online is a Cross Platform, 2D open world massive multiplayer online role playing game"
arch=('x86_64')
url="https://kakele.io"
license=('custom')
depends=()
source=("https://kakele.nyc3.cdn.digitaloceanspaces.com/latest/kakele-linux.zip" 'kakele.desktop')
md5sums=('SKIP' '5a4a0daff7b25f948e42d8d0150cddc5')

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "$(xdg-user-dir PICTURES)/kakele"
    bsdtar -xOf "kakele.jar" "image/icon.png" > "${srcdir}/kakele.png"
    cp -R "${srcdir}/"* "${pkgdir}/opt/${pkgname}"
    rm "${pkgdir}/opt/${pkgname}/kakele.desktop"
    cp -R "../kakele.desktop" "${pkgdir}/opt/${pkgname}/kakele.desktop"
    chmod -R 755 "${pkgdir}/opt/${pkgname}/${pkgname}"
    ln -s "/opt/${pkgname}/kakele" "${pkgdir}/usr/bin/kakele"
    ln -s "$(xdg-user-dir PICTURES)/kakele" "${pkgdir}/opt/${pkgname}/screenshots"
    ln -s "/opt/${pkgname}/kakele.png" "${pkgdir}/usr/share/pixmaps"
    ln -s "/opt/${pkgname}/kakele.desktop" "${pkgdir}/usr/share/applications/kakele.desktop"
}
