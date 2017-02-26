# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Diego <cdprincipe@gmail.com>

pkgname=numix-gtk-theme-git
pkgver=2.6.6.r18.f25d7e0
pkgrel=1
pkgdesc='A flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
makedepends=('gdk-pixbuf2' 'git' 'glib2' 'libxml2' 'ruby-sass')
optdepends=('gtk-engine-murrine: GTK2 theme engine')
provides=('numix-gtk-theme')
conflicts=('numix-gtk-theme')
replaces=('numix-themes-git')
source=('git+https://github.com/numixproject/numix-gtk-theme.git')
md5sums=('SKIP')

pkgver() {
  cd numix-gtk-theme

  git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./'
}

build() {
  cd numix-gtk-theme

  make
}

package() {
  cd numix-gtk-theme

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
