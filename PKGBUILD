# Maintainer: Jan Neumann <neum DOT ja AT gmail DOT com

pkgname=adapta-aurorae-theme-git
gitname=adapta-kde
pkgver=r98.418ab02
pkgrel=1
pkgdesc="adapta decorations for Kwin (git version)"
arch=('x86_64')
url="https://github.com/PapirusDevelopmentTeam/adapta-kde"
license=('GPL')
depends=('kwin')
makedepends=('git' 'make')
conflicts=('adapta-kde' 'adapta-kde-git')
source=("git+https://github.com/PapirusDevelopmentTeam/adapta-kde.git")
sha256sums=('SKIP')

pkgver() {
    cd ${srcdir}/${gitname}

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  
}

package() {
    mkdir -p $pkgdir/usr/share/aurorae/themes
    cp -r ${srcdir}/${gitname}/aurorae/themes/Adapta ${pkgdir}/usr/share/aurorae/themes/
}
