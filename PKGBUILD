# Maintainer: Sebastian Morr <sebastian@morr.cc>

pkgname=bucklespring-git
_gitname=bucklespring
pkgver=20210311
pkgrel=1
pkgdesc="Nostalgia bucklespring keyboard sound, sampled from IBM's Model-M"
arch=('i686' 'x86_64')
url="http://github.com/zevv/bucklespring"
license=('MIT')
depends=('openal' 'alure' 'libxtst')
makedepends=('git')
conflicts=('bucklespring')
source=('git+https://github.com/zevv/bucklespring')
sha1sums=('SKIP')

build() {
  cd "$srcdir/$_gitname"
  make PATH_AUDIO=/usr/share/bucklespring
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 buckle "$pkgdir"/usr/bin/buckle
  install -Dm644 -t "$pkgdir"/usr/share/bucklespring/ wav/*
}
