# Contributor: grimi

pkgname=xcursor-bmz
pkgver=1.9
pkgrel=1
pkgdesc="Mouse cursor for X11 desktop. Inspiration was drawn from various sources, including DMZ and Breeze, but design manages to be quite unique."
arch=('any')
url="https://www.gnome-look.org/p/1158321/"
license=('GPL')
depends=('libxcursor')
_hash_time=($(curl -s "$url"|grep -e "hash =" -e "timetamp ="|sed "s/.*= '\(.*\)';/\1/"))
source=("${pkgname}-${pkgver}.tar.gz::https://dl.opendesktop.org/api/files/downloadfile/id/1542022326/s/${_hash_time[0]}/t/${_hash_time[1]}/BMZ-20181112113039.tar.gz")
sha256sums=('3da74926a5aa3c591d769a68670a95fc1f74c6693514df7759cad4af78e78015')


package() {
  find BMZ/ -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/icons/{}" \;
  find BMZ/ -type l -exec cp -d "{}" "${pkgdir}/usr/share/icons/{}" \;
}

# vim:set ts=2 sw=2 et:

