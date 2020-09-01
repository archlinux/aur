# Maintainer: Nico <desoxhd@gmail.com>
pkgname=whitesur-kvantum-theme-git
_themeName=WhiteSur
_gitname="$_themeName-kde"
pkgver=r23.f8277d2
pkgrel=1
pkgdesc="MacOS big sur like theme for KDE Plasma"
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL3')
depends=('kvantum-qt5')
optdepends=( 'whitesur-icon-theme-git: matching icon theme' 'whitesur-cursor-theme-git: matching cursor theme' 'whitesur-gtk-theme-git: matching gtk theme' ) 
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')
conflicts=('whitesur-kde-theme-git')

pkgver() {
   cd ${_gitname}
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   # make folders
   mkdir -p "${pkgdir}/usr/share/Kvantum"
   # kvantum theme
   cp -r "${srcdir}/${_gitname}/Kvantum"/* "${pkgdir}/usr/share/Kvantum"

} 
