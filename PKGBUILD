#Maintainer: dreieck

_pkgname=unison-gtk
_pkgver=2.48.4
pkgname="${_pkgname}-${_pkgver}"
pkgver="${_pkgver}"
pkgrel=3
pkgdesc="Makes the specific version ${_pkgver} of ${_pkgname} available as default ${_pkgname}."
url='http://www.cis.upenn.edu/~bcpierce/unison/'
arch=(
  'any'
)
license=('GPL-3.0-or-later')
depends=(
  "${_pkgname}-${_pkgver}-compat"
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)

package() {

  install -dm755 "${pkgdir}"/usr/bin
  cd "${pkgdir}"/usr/bin
  ln -s "unison-${_pkgver}-gtk" "unison-gtk"
  if [ -e "/usr/bin/unison-${_pkgver}-x11" ]; then
    ln -s "unison-${_pkgver}-x11" "unison-x11"
  fi

  install -dm755 "${pkgdir}"/usr/share/man/man1
  cd "${pkgdir}"/usr/share/man/man1
  ln -s unison-2.48.4-gtk.1.gz unison-gtk.1.gz

  install -dm755 "${pkgdir}"/usr/share/applications
  cd "${pkgdir}"/usr/share/applications
  ln -s unison-gtk-2.48.4.desktop unison-gtk.desktop

  install -dm755 "${pkgdir}"/usr/share/pixmaps
  cd "${pkgdir}"/usr/share/pixmaps
  ln -s unison-gtk-2.48.4.svg unison-gtk.svg
  ln -s unison-gtk-2.48.4.xpm unison-gtk.xpm
}
