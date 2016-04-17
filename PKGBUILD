# Maintainer: Kyle Bloss <kylebloss[at]pelpix[dot]info>

pkgname=mp4fpsmod
_pkgname=mp4fpsmod
pkgver=0.14
pkgrel=2
pkgdesc="Simple CLI MP4 time code editor"
arch=('any')
license=('custom')
source=("git://github.com/nu774/${_pkgname}.git#commit=d6fa8ed")
url="https://sites.google.com/site/qaacpage/junk"
provides=('mp4fpsmod')
conflicts=('mp4fpsmod-git')
makedepends=('git')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  ./bootstrap.sh
}

build() {
  cd "$srcdir/$_pkgname/"
  ./configure --prefix=/usr
  make

  strip mp4fpsmod
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="${pkgdir}" install
}
