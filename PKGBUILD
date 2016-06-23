# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# ginger-base-git
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=()
pkgname=('ginger-base-git')

# Version
pkgver=2.1.0.r46.g760a5d1
pkgrel=1
#epoch=

# Generic
pkgdesc="Basic host management for WoK"
arch=('any')
url="http://kimchi-project.github.io/gingerbase/"
license=('AGPL2.1' 'Apache')
groups=('kimchi-project')

# Dependencies
depends=('python2-configobj'
         'python2-pyparted'
         'wokd')
#optdepends=()
makedepends=('git')
#checkdepends=()

# Package Relations
provides=('ginger-base')
conflicts=('ginger-base')
#replaces=()

# Others
backup=('etc/wok/plugins.d/gingerbase.conf')
#options=()
#install=
#changelog=

# Sources
source=('git+https://github.com/kimchi-project/gingerbase.git')
#source_i686=("")
#source_x86_64=("")
#noextract=()
#validpgpkeys=()

# Integrity
#md5sums=()
#md5sums_i686=()
#md5sums_x86_64=()
#sha1sums=()
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/gingerbase
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/gingerbase
}

build() {
  cd $srcdir/gingerbase
  PYTHON=/usr/bin/python2 ./autogen.sh --system && make
}

#check() {
#}

package() {
  cd $srcdir/gingerbase
  make DESTDIR=$pkgdir install
}
