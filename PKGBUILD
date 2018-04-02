# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=luminance-git
pkgver=21
pkgrel=1
pkgdesc="Luminance is a Philips Hue client for Linux written in Python and GTK+"
arch=('any')
url="https://github.com/craigcabrey/luminance"
license=('GPL2')
groups=()
depends=('python' 'dconf' 'hicolor-icon-theme')
makedepends=('git' 'autoconf' 'python' 'python-requests' 'gtk3' 'pygobject-devel')
optdepends=()
provides=()
conflicts=('')
replaces=()
backup=()
options=()
install=()
changelog=()
source=('git+https://github.com/craigcabrey/luminance.git')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd luminance
  git rev-list --count HEAD
}

build() {
  cd luminance
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd luminance
  make DESTDIR="$pkgdir/" install
}
