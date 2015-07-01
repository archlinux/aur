# Maintainer: Alain Kalker <a DOT c DOT kalker AT gmail DOT com>
_gitname=alsa-ladspa-bridge
pkgname=$_gitname-git
pkgver=0.0.108.05e0f73
pkgrel=1
pkgdesc="an alsa-plugin that utiliizes LADSPA"
arch=('i686' 'x86_64')
url="https://github.com/iem-projects/alsa-ladspa-bridge"
license=('GPL')
depends=('alsa-lib' 'ladspa')
makedepends=('git')
source=("git+https://github.com/iem-projects/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo "0.0.$(git rev-list --count master).$(git rev-parse --short master)"
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
