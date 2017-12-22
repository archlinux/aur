# Contributor: grimi <grimi at poczta dot fm>

pkgname=xcursor-lliurex
pkgver=20120801
pkgrel=3
pkgdesc="A cursor theme inspirated on oxygen theme, but drawn from the scratch."
arch=('any')
url="https://www.gnome-look.org/content/show.php/Lliurex+cursors?content=153068"
license=('GPL')
depends=('libxcursor')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("${pkgname}-${pkgver}.tar.xz::https://dl.opendesktop.org/api/files/downloadfile/id/1460735232/s/${_hash_time[0]}/t/${_hash_time[1]}/153068-lliurex-cursors.tar.xz")
sha256sums=('db1056c5719116867459e7764d06d9b2458525a8e16d184e0dc6f791f8e78e2f')


package() {
  mv lliurex{-cursors,}
  sed "s/lliurex-cursors/Lliurex/" -i lliurex/index.theme
  find lliurex/ -type f \
    -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find lliurex/ -type l \
    -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}

# vim:set ts=2 sw=2 sts=2 et:

