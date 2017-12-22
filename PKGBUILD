# Contributor: grimi <grimi at poczta dot fm>

pkgname=xcursor-numix
pkgver=0.9.1
pkgrel=3
pkgdesc="An X-cursor-theme for use along with the numixproject products."
arch=('any')
url="https://www.gnome-look.org/p/999876/"
license=('GPL')
depends=('libxcursor')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/downloadfile/id/1460735152/s/${_hash_time[0]}/t/${_hash_time[1]}/169299-numix-cursor.tar.gz")
sha256sums=('99fa7c724f00e8b113468065ca202fa06105b90eaefc430a4871d66cb35475ac')

package() {
  cd theme
  find Numix-Cursor/ -type f -not -name "*~" \
      -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find Numix-Cursor/ -type l \
      -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}

# vim:set ts=2 sw=2 et:

