# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

# Based on numix-themes-git
# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Diego <cdprincipe@gmail.com>

pkgname=numix-themes-darkblue
pkgver=2.6.1
pkgrel=1
pkgdesc='A flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce) (Dark Blue Variant)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
makedepends=('git' 'glib2' 'ruby-sass')
optdepends=('gtk-engine-murrine: GTK2 theme engine')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/numixproject/numix-gtk-theme/archive/2.6.1.tar.gz"
		'dark_colors.patch')
md5sums=('499e2e8e9d7d1d81403ebf8f65c8ced6'
         'a73ce14c46aabad53ddf6c1c467b2b67')

prepare() {
  cd "$srcdir/numix-gtk-theme-$pkgver/"

  patch -Np1 -i ../dark_colors.patch
  ln -srf gtk-3.0/gtk{-dark,}.css
  ln -srf gtk-3.20/gtk{-dark,}.css
}

build() {
  cd "$srcdir/numix-gtk-theme-$pkgver/"
  make
}

package() {
  cd "$srcdir/numix-gtk-theme-$pkgver/"
  make INSTALL_DIR="${pkgdir}/usr/share/themes/Numix-DarkBlue" install
}

# vim: ts=2 sw=2 et:
