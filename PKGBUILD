# 

pkgname=kbd-tapper
_pkgname=tapper
pkgver=0.3.1
pkgrel=1
pkgdesc='A keyboard layout selector for Gnome Shell or X Window'
# 'Tapper selects specified keyboard layout when user *taps* specified key. It always *selects* layouts and never *toggles* them.'
arch=('x86_64')
url='http://kbd-tapper.sourceforge.net/en.html'
license=('GPL')
depends=('libxtst' 'json-glib')
source=(https://sourceforge.net/projects/${pkgname}/files/${pkgver}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('667af8d92b8dada2a46f79a957e3cd10c0cc16ba40cb1d31d8593a225710de83')

build() {
  cd ${_pkgname}-${pkgver}
  mkdir _build && cd _build
  ../configure --prefix=/usr
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  cd _build
  make DESTDIR="${pkgdir}" install
}

#arch=('i686' 'x86_64')
