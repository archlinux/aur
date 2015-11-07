pkgname=masalla-icon-theme-git
pkgname=masalla-icon-theme
pkgver=r.
pkgrel=1
pkgdesc="Latest flat design theme by Hayder Majid"
arch=('any')
url="https://github.com/hayderctee/masalla-icon-theme"
license=('GPL3')
depends=()
makedepends=('git')
optdepends=()
provides=('masalla-icon-theme-git')
conflicts=('masalla-icon-theme-git')
source=('git+https://github.com/hayderctee/masalla-icon-theme.git')
sha256sums=('SKIP')

pkgver(){
    cd ${_gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_gitname}/${_pkgname} ${pkgdir}/usr/share/icons/Masalla
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

