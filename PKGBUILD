# Maintainer: Nicholas Georgescu <nsg27@case.edu>

pkgname=todoist-appimage-integration
pkgver=1.0
pkgrel=1
pkgdesc="Integrates Todoist AppImage with the system using AppImageLauncher"
arch=('any')
depends=('todoist-appimage')
optdepends=('appimagelauncher: to integrate Todoist AppImage into the system')
source=()
noextract=()
md5sums=()

package() {
    if command -v ail-cli &> /dev/null && command -v todoist &> /dev/null; then
        ail-cli integrate $(which todoist)
    else
        echo "Ensure both appimagelauncher and todoist-appimage are installed."
    fi
}

