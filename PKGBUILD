

pkgname=geary-plank-bzr
pkgver=r1843
pkgrel=1
pkgdesc='The Pantheon Mailer- this package provides plank integration'
arch=('i686' 'x86_64')
url='https://launchpad.net/geary'
license=('GPL3')
groups=('pantheon-integration')
depends=('gmime' 'gnome-keyring' 'libcanberra' 'libgee' 'libnotify' 'librsvg' 'webkitgtk' 'libunity' 'dee-bzr')
makedepends=('bzr' 'cmake' 'gnome-doc-utils' 'gobject-introspection' 'intltool' 'vala')
provides=('geary-plank-bzr')
conflicts=('geary' 'geary-unity' 'geary-git')
install='geary.install'
source=('geary::bzr+http://bazaar.launchpad.net/~yorba/geary/trunk/')
sha256sums=('SKIP')

pkgver() {
  cd geary

  echo "r$(bzr revno)"
}

build() {
  cd geary

  ./configure \
    --prefix='/usr' 
  make
}

package() {
  cd geary

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:

