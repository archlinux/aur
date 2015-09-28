# Maintainer: Julian Hornich <vivaeltopo@googlemail.com>

pkgname=gnome-shell-theme-viva-git
_pkgver=3.18.1
pkgver=3.18.1.112.f4fc574
pkgrel=1
pkgdesc="A custom gnome-shell theme named viva"
arch=('any')
url="https://github.com/vivaeltopo/gnome-shell-theme-viva"
groups=('gnome-shell-extensions')
license=('GPL3')
depends=('gnome-shell>=3.18' 'ttf-opensans' 'ttf-impallari-raleway-family')
source=('git+https://github.com/vivaeltopo/gnome-shell-theme-viva.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/gnome-shell-theme-viva
  echo ${_pkgver}.$(git rev-list --count master).$(git rev-parse --short master)
}

package() {
	# orange version
  cd $srcdir/gnome-shell-theme-viva
  make orange

  mkdir -p ${pkgdir}/usr/share/themes/viva-orange
  cp -r gnome-shell ${pkgdir}/usr/share/themes/viva-orange/
  chmod -R 755 ${pkgdir}/usr/share/themes/viva-orange

  # blue version
  cd $srcdir/gnome-shell-theme-viva
  make blue

  mkdir -p ${pkgdir}/usr/share/themes/viva-blue
  cp -r gnome-shell ${pkgdir}/usr/share/themes/viva-blue/
  chmod -R 755 ${pkgdir}/usr/share/themes/viva-blue
}
