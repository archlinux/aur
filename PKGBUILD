# Mainintainer : Lucas Rooyakkers <lucas dot rooyakkers at queensu at ca>

pkgname='gr-baz'
pkgver='fdad72a'
pkgrel=3
pkgdesc="gr-baz is a GNU Radio project that adds new functionality (blocks, GRC definitions, apps, etc)."
arch=('any')
url="https://github.com/balint256/gr-baz"
license=('unknown')
depends=('gnuradio' 'swig')
makedepends=('cmake')
provides=('gr-baz')
source=('git+https://github.com/balint256/gr-baz')
sha1sums=('SKIP')
_gitname=gr-baz

pkgver() {
  cd "$_gitname"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "$_gitname"
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$_gitname"
  cd build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
