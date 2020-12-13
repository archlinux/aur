# 

pkgname=kbd-tapper
_pkgname=tapper
pkgver=0.4.4
_pkgver=0.4.4-0.vdb.1
pkgrel=1
pkgdesc='A keyboard layout selector for Gnome Shell, X Window System and Wayland'
# 'Tapper selects specified keyboard layout when user *taps* specified key. It always *selects* layouts and never *toggles* them.'
arch=('x86_64')
url='http://kbd-tapper.sourceforge.net/en.html'
license=('GPL')
depends=('dconf' 'glibmm' 'libinput' 'libxtst' 'json-glib')
source=(https://sourceforge.net/projects/${pkgname}/files/${pkgver}/${_pkgname}-${_pkgver}.tar.gz)
sha256sums=('97ca78c5995c20d390f8a1d3ca78ce81104adf42bb9318f4cf341d2713e3b60a')

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
