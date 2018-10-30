# Maintainer: Ave Ozkal <aurpub@ave.zone>

_name=fusee-nano
pkgname="$_name-git"
pkgver=0.4.0.gdde2492
pkgrel=1
pkgdesc="A minimalist re-implementation of the Fusée Gelée exploit, designed to run on embedded Linux devices. "
arch=('any')
url="https://github.com/DavidBuchanan314/fusee-nano"
license=('mit')
makedepends=('git')
source=("$_name::git+https://github.com/DavidBuchanan314/fusee-nano")
md5sums=('SKIP')

pkgver() {
  cd $_name
  git describe --long --tags | tr - .
}

build() {
  cd $_name
  make
}

package() {
  cd $_name
  mkdir -p "$pkgdir/usr/bin"
  cp fusee-nano "$pkgdir/usr/bin"
}

