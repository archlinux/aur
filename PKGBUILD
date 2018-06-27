# Maintainer: Storm Dragon <stormdragon2976@gmail.com>

_gitname='gama_tts'
pkgname="$_gitname"-git
pkgver=v0.8
pkgrel=1
pkgdesc='An articulatory synthesizer that converts text to speech.'
arch=('armv7h' 'i686' 'x86_64')
url='https://gitlab.com/mym-br/gama_tts'
license=('GPL3')
makedepends=('cmake' 'git')
provides=("$_gitname")
conflicts=("$_gitname")
install="$pkgname".install
source=("git+https://gitlab.com/mym-br/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  local ver="$(git describe --tags)"
  echo "${ver//-/.}"
}

build() {
  cd "$srcdir/$_gitname"
  cmake -D CMAKE_BUILD_TYPE=Release .
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: set ts=2 sw=2 et:
