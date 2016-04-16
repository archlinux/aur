# Maintainer: 1213 <lambertacampo at gmail dot com>
pkgname=exaile-git
pkgver=3.4.5.r569.g0f06dfe
pkgrel=1
pkgdesc="music player for gnome, similar to KDEs amarok"
arch=('any')
url="www.exaile.org"
license=('GPL')
groups=()
depends=(
  'python2>=2.7.0' 
  'gtk3>=3.10' 
  'gstreamer>=1.4' 
  'mutagen>=1.10' 
  'python2-dbus'
  'python2-gobject>=3.13.2'
  'python2-cairo'
  'udisks2'
  'librsvg'
  'gst-plugins-good')

makedepends=(
  'git')

optdepends=(
  'python2-beautifulsoup3: lyricwiki plugin'
  )
provides=('exaile')
conflicts=('exaile')
replaces=()
backup=()
options=()
install=()
source=(git://github.com/exaile/exaile.git)
noextract=()
md5sums=('SKIP')

_gitname=exaile

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
}

build() {
  cd "$_gitname"
  make clean
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
