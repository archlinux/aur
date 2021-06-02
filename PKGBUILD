# Maintainer: Sabu Siyad <ssiyad at disroot dot org>
# This PKGBUILD is maintained at https://github.com/ssiyad/pkgbuilds/

pkgname=clubhouse-desktop-bin
_pkgname=clubhouse-desktop
pkgver=1.0.2
pkgrel=1
pkgdesc="An unofficial Clubhouse desktop client"
arch=('x86_64')
url="https://github.com/callmearta/clubhouse-desktop"
license=("MIT")
provides=("clubhouse-desktop")
source=(
    "$url/releases/download/${pkgver}/clubhouse-linux-x64.zip"
    "clubhouse-desktop.sh"
    "clubhouse-desktop.desktop"
)
sha256sums=(
    "5d6fa337491bce097afa3a4d4b7b0f2a63ccb49f4ad6c717e16202edd785c297"
    "b3cee2deede1e69172d0b2cc246e0e259675f8c0fd09de339027288aebb224fa"
    "d088cea66fa7d5f8e99d29b150a33b311131a9c38144f0093ccca9bd633aaa52"
)

package() {
    cd ${srcdir}
    install -Dm755 clubhouse-desktop.sh "${pkgdir}"/usr/bin/"${_pkgname}"
    install -Dm755 clubhouse-desktop.desktop "${pkgdir}"/usr/share/applications/clubhouse-desktop.desktop
    mkdir -p "${pkgdir}"/usr/lib/
    cp -r clubhouse-linux-x64 "${pkgdir}"/usr/lib/"${_pkgname}"
    install -Dm644 clubhouse-linux-x64/LICENSE "${pkgdir}"/usr/share/licenses/"${_pkgname}"/LICENSE
}
