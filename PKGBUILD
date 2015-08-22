# Maintainer: jstoik1 <joshstoik at gmail dot com>
pkgname=jpegrescan-git
pkgver=20150822
pkgrel=1
pkgdesc="Losslessly shrink any JPEG file."
arch=(any)
url="https://github.com/kud/jpegrescan"
license=('GPL')
depends=('perl-file-slurp' 'libjpeg-turbo')
makedepends=('setuptools' 'git')
source=('jpegrescan::git+git://github.com/kud/jpegrescan.git')
sha512sums=('SKIP')

_gitname='jpegrescan'

build() {
  cd "$srcdir"

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  msg 'Starting build...'
}

package() {
  cd "$srcdir/$_gitname-build"

  mkdir -p "$pkgdir/usr/bin"
  cp jpegrescan "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et: