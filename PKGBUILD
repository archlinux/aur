# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jun Bo Bi <jambonmcyeah@gmail.com>
pkgname=('canta-gtk-theme' 'canta-icon-theme')
pkgbase=canta-theme
pkgdesc="Flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell"
_pkgver=2021-09-08
pkgver=${_pkgver//-/.}
pkgrel=1
arch=('any')
url="https://www.gnome-look.org/p/1220749"
license=('GPL2')
makedepends=('gnome-shell' 'gtk3' 'sassc')
options=('!strip')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/vinceliuice/Canta-theme/archive/refs/tags/$_pkgver.tar.gz")
sha256sums=('98f6b71fbc46b1b9e1b256588cf930f780952f95c57f48c9922065c8b333bacd')

package_canta-theme() {
  return 0
}

package_canta-gtk-theme() {
  depends=('gnome-themes-extra' 'gtk3')
  optdepends=('gtk-engine-murrine: GTK2 theme support'
              'gtk-engines: GTK2 theme support'
              'canta-icon-theme: Matching icon theme')

  cd "Canta-theme-$_pkgver"
  install -d "$pkgdir/usr/share/themes"

  # Install theme with Nautilus background image
  for theme in standard blue indigo; do
    ./install.sh -t ${theme} -d "$pkgdir/usr/share/themes"
  done

  # Install theme without Nautilus background image
#  for theme in standard blue indigo; do
#    ./install.sh -o -t ${theme} -d "$pkgdir/usr/share/themes"
#  done
}

package_canta-icon-theme() {
  pkgdesc="Flat icons for Canta GTK theme"
  optdepends=('numix-circle-icon-theme: if you want a better experience')

  cd "Canta-theme-$_pkgver"
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -i -d "$pkgdir/usr/share/icons"
}
