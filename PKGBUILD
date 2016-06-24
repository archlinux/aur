# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# ginger-base
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=()
pkgname=('ginger-base')

# Version
pkgver=2.2.0
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
#provides=()
conflicts=('ginger-base-git')
#replaces=()

# Others
backup=('etc/wok/plugins.d/gingerbase.conf')
#options=()
#install=
#changelog=

# Sources
source=('https://github.com/kimchi-project/gingerbase/archive/'${pkgver}'.tar.gz')
#source_i686=("")
#source_x86_64=("")
#noextract=()
#validpgpkeys=()

# Integrity
#md5sums=()
#md5sums_i686=()
#md5sums_x86_64=()
#sha1sums=()
sha256sums=('bda800554cada0436244792489b12e5eac4af5718e6b830311953790fe98affe')

#pkgver() {
#}

prepare() {
  cd $srcdir/gingerbase-${pkgver}
}

build() {
  cd $srcdir/gingerbase-${pkgver}
  PYTHON=/usr/bin/python2 ./autogen.sh --system && make
}

#check() {
#}

package() {
  cd $srcdir/gingerbase-${pkgver}
  make DESTDIR=$pkgdir install
}
