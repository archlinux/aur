# Maintainer: Julian Hornich <vivaeltopo@googlemail.com>

pkgname=gnome-shell-theme-viva-git
_pkgver=3.18.0
pkgver=3.18.0.110.4023c49
pkgrel=1
pkgdesc="A custom gnome-shell theme named viva"
arch=('any')
url="https://github.com/vivaeltopo/gnome-shell-theme-viva"
groups=('gnome-shell-extensions')
license=('GPL3')
depends=('gnome-shell>=3.18','ttf-opensans','ttf-impallari-raleway-family')
source=('git+https://github.com/vivaeltopo/gnome-shell-theme-viva.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/gnome-shell-theme-viva
  echo ${_pkgver}.$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
    cd $srcdir/gnome-shell-theme-viva

    mkdir -p ${pkgdir}/usr/share/themes/gnome-shell-theme-viva
    cp -r gnome-shell ${pkgdir}/usr/share/themes/gnome-shell-theme-viva/
    chmod -R 755 ${pkgdir}/usr/share/themes/gnome-shell-theme-viva
}
