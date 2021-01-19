# Maintainer: Martin Filion <Mordillo98@gmail.com>
# Contributor: Christian Hesse <arch@eworm.de>
# Contributor: BlackICE <manfredi at gmail.com>
# Contributor: jsteel <jsteel at aur.archlinux.org>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Marius <marius at matamare dot ro>

pkgname=gnome-colors-icon-theme
pkgname_link=gnome-colors-icon-theme
pkgver=5.5.1
pkgrel=3
pkgdesc='GNOME-Colors icon theme'
arch=('any')
url='https://github.com/gnome-colors/gnome-colors'
license=('GPL2')
conflicts=('gnome-colors-icon-theme-extras')
replaces=('gnome-colors-icon-theme-extras')
makedepends=('git' 'inkscape' 'imagemagick' 'gnome-icon-theme' 'gnome-icon-theme-symbolic')
source=("git://github.com/gnome-colors/gnome-colors")
sha256sums=('SKIP')

prepare() {

 cd "${srcdir}/gnome-colors/gnome-colors/"
 patch -i ../../../inkscape_command.patch

}

build() {

  cd "${srcdir}/gnome-colors/gnome-colors/"
  
  make

}

package() {

  cd "${srcdir}/gnome-colors/gnome-colors/"

  make DESTDIR="${pkgdir}"/ install

}

