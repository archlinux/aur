# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=osm-bulk-upload-git
_pkgname="${pkgname%-git}"
pkgver=r7.90c61f5
pkgrel=1
pkgdesc="set of tools for performing bulk imports to OpenStreetMap database"
url="https://wiki.openstreetmap.org/wiki/Upload.py"
depends=('python')
makedepends=('git')
license=('GPL')
arch=('any')
source=("${_pkgname}"::'git+https://github.com/grigory-rechistov/osm-bulk-upload')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${_pkgname}
  install -dm755 "$pkgdir/usr/share/${_pkgname}"
  for file in *.py
  do
    install -Dm755 "${file}" "${pkgdir}/usr/share/${_pkgname}/${file}"
  done
}

# vim:set ts=2 sw=2 et:
