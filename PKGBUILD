# Maintainer: crwn1337

pkgname=proton-experimental-symlink
pkgver=1.0
pkgrel=1
pkgdesc="Symlinks Proton Experimental as wine, DO NOT BUILD AS ROOT!"
arch=('any')
url="https://github.com/crwn1337/proton-experimental-symlink"
license=('MIT')
provides=('wine')
conflicts=('wine')

package() {
    mkdir -p "${pkgdir}/usr/bin"

    ln -s "${HOME}/.steam/steam/steamapps/common/Proton - Experimental/files/bin/wine" "${pkgdir}/usr/bin/wine"
    ln -s "${HOME}/.steam/steam/steamapps/common/Proton - Experimental/files/bin/wine-preloader" "${pkgdir}/usr/bin/wine-preloader"

    ln -s "${HOME}/.steam/steam/steamapps/common/Proton - Experimental/files/bin/wine64" "${pkgdir}/usr/bin/wine64"
    ln -s "${HOME}/.steam/steam/steamapps/common/Proton - Experimental/files/bin/wine64-preloader" "${pkgdir}/usr/bin/wine64-preloader"

    ln -s "${HOME}/.steam/steam/steamapps/common/Proton - Experimental/files/bin/wineserver" "${pkgdir}/usr/bin/wineserver"

    echo "#!/bin/sh" > "${pkgdir}/usr/bin/wineboot"
    echo "exec wine wineboot \"\$@\"" >> "${pkgdir}/usr/bin/wineboot"
    chmod +x "${pkgdir}/usr/bin/wineboot"
}