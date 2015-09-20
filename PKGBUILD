# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Diego <cdprincipe@gmail.com>

pkgname=numix-themes-git
pkgver=2.5.1.r98.5cccc5b
pkgrel=2
pkgdesc='A flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
makedepends=('git' 'glib2' 'ruby-sass')
optdepends=('gtk-engine-murrine: GTK2 theme engine')
provides=('numix-themes')
conflicts=('numix-themes')
source=('numix-themes::git+https://github.com/shimmerproject/Numix.git')
md5sums=('SKIP')

pkgver() {
  cd numix-themes

  git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./'
}

build() {
  cd numix-themes

  make
}

package() {
  cd numix-themes

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
