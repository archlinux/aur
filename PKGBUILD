# 

pkgname=kbd-tapper
_pkgname=tapper
pkgver=0.4.2
_pkgver=0.4.2-0.vdb.1
pkgrel=1
pkgdesc='A keyboard layout selector for Gnome Shell, X Window System and Wayland'
# 'Tapper selects specified keyboard layout when user *taps* specified key. It always *selects* layouts and never *toggles* them.'
arch=('x86_64')
url='http://kbd-tapper.sourceforge.net/en.html'
license=('GPL')
depends=('dconf' 'glibmm' 'libinput' 'libxtst' 'json-glib')
source=(https://sourceforge.net/projects/${pkgname}/files/${pkgver}/${_pkgname}-${_pkgver}.tar.gz)
sha256sums=('dba1943c8ba79b9eb8fa5549aadbb3ae1096cf722e0f183457dcc9c9c850cb3d')

build() {
  cd ${_pkgname}-${_pkgver}
  mkdir _build && cd _build
  ../configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-${_pkgver}
  cd _build
  make DESTDIR="${pkgdir}" install
}

#arch=('i686' 'x86_64')
