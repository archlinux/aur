# Maintainer: Jared Sutton <jpsutton at gmail dot com>
pkgname=playgsf-git
_pkgname=playgsf
pkgver=r9.9653dc6
pkgrel=1
pkgdesc="Simple command line player for gsf files based on a winamp plugin"
arch=('i686' 'x86_64')
conflicts=('playgsf')
provides=('playgsf')
url="https://github.com/jpsutton/${_pkgname}"
license=('unknown')
groups=('multimedia')
makedepends=('libsndfile' 'libsamplerate')
depends=('libao' 'zlib')
source=("git+https://github.com/jpsutton/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "$pkgdir/usr/bin/"
  install playgsf "$pkgdir/usr/bin/"
}
