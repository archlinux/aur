# Contributor: grimi <grimi at poczta dot fm>

pkgname=xcursor-lliurex
pkgver=20120801
pkgrel=1
pkgdesc="A cursor theme inspirated on oxygen theme, but drawn from the scratch."
arch=('any')
url="http://gnome-look.org/content/show.php/Lliurex+cursors?content=153068"
license=('GPL')
depends=('libxcursor')
source=("${pkgname}-${pkgver}.tar.xz::http://gnome-look.org/CONTENT/content-files/153068-lliurex-cursors.tar.xz")
md5sums=('1a22fb7cda1ba4aff50c9e48d2a3ce88')


package() {
  mv lliurex{-cursors,}
  sed "s/lliurex-cursors/Lliurex/" -i lliurex/index.theme
  find lliurex/ -type f -not -name "*~" \
      -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find lliurex/ -type l \
      -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}

# vim:set ts=2 sw=2 et:

