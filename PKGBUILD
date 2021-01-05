# 

pkgname=kbd-tapper
_pkgname=tapper
pkgver=0.5.0
_pkgver=0.5.0-0.vdb.1
pkgrel=1
pkgdesc='A keyboard layout switcher for X Window System and Wayland'
# 'Tapper selects specified keyboard layout when user *taps* specified key. It always *selects* layouts and never *toggles* them.'
arch=('x86_64')
url='http://kbd-tapper.sourceforge.net/en.html'
license=('GPL3')
depends=('dconf' 'glibmm' 'libinput' 'libxtst' 'json-glib')
source=(https://sourceforge.net/projects/${pkgname}/files/${pkgver}/${_pkgname}-${_pkgver}.tar.gz)
sha256sums=('81dddbc84348e1bd19135c1e2a49f3937a5bac55147f9cf7ba50730d0a53dc92')

build() {
  cd ${_pkgname}-${_pkgver}
  [ ! -d _build ] && mkdir _build
  cd _build
  ../configure --prefix=/usr --disable-rpm --disable-html
  make
}

package() {
  cd ${_pkgname}-${_pkgver}
  cd _build
  make DESTDIR="${pkgdir}" install
}
