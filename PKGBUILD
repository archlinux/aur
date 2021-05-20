# Maintainer: Francois Menning <f.menning at pm me>
# Contributor: Kibouo <csonka.mihaly@hotmail.com>

pkgname=matcha-gtk-theme-git
pkgver=2021.05.20.r0.gd622941
pkgrel=1
pkgdesc='A flat design theme for GTK3, GTK2, and Gnome-Shell.'
arch=('any')
url='https://vinceliuice.github.io/theme-matcha'
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
makedepends=('git')
provides=('matcha-gtk-theme')
conflicts=('matcha-gtk-theme')
source=("$pkgname::git+https://github.com/vinceliuice/Matcha-gtk-theme.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"

  install -dm755 "${pkgdir}/usr/share/themes"

  ./install.sh -d "${pkgdir}/usr/share/themes"
}
