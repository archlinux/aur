# Contributor: grimi <grimi at poczta dot fm>

pkgname=xcursor-bmz
pkgver=1.8
pkgrel=4
pkgdesc="Mouse cursor for X11 desktop. Inspiration was drawn from various sources, including DMZ and Breeze, but design manages to be quite unique."
arch=('any')
url="https://www.gnome-look.org/p/1158321/"
license=('GPL')
depends=('libxcursor')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/downloadfile/id/1515839449/s/${_hash_time[0]}/t/${_hash_time[1]}/BMZ.tar.gz")
sha256sums=('fb0054106c5c80df446f6bf440fec4c2140030e5fa64676ccb042f700e0cafb6')



package() {
  find BMZ/ -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find BMZ/ -type l -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}

# vim:set ts=2 sw=2 et:

