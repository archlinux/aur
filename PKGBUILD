# Contributor: grimi <grimi at poczta dot fm>

pkgname=xcursor-lliurex
pkgver=20120801
pkgrel=2
pkgdesc="A cursor theme inspirated on oxygen theme, but drawn from the scratch."
arch=('any')
url="http://gnome-look.org/content/show.php/Lliurex+cursors?content=153068"
license=('GPL')
depends=('libxcursor')
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/download/id/1460735232/153068-lliurex-cursors.tar.xz")
sha1sums=('711e535b3e088b2c83bd9627a667724f488be50a')


package() {
  mv lliurex{-cursors,}
  sed "s/lliurex-cursors/Lliurex/" -i lliurex/index.theme
  find lliurex/ -type f \
    -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find lliurex/ -type l \
    -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}

# vim:set ts=2 sw=2 sts=2 et:

