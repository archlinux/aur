pkgname=croco-wallpapers
pkgver=r3.eb2d0fd
pkgrel=1
pkgdesc="wallpaper collection"
arch=('any')
url="https://gitlab.com/croco-os/themes-and-settings/artwork/croco-wallpapers"
license=('GPLv3')
makedepends=('git')
depends=()
source=("git+https://gitlab.com/croco-os/themes-and-settings/artwork/croco-wallpapers.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/croco-wallpapers"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {
    cd ${pkgname}

    install -d ${pkgdir}/usr/share/wallpapers/croco-wallpapers
    cp -r src/croco-wallpapers/* ${pkgdir}/usr/share/wallpapers/croco-wallpapers
}
 
