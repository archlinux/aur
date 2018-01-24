# Maintainer: cr0mag <phillips.julian AT gmail DOT com>
# Contributor: rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# ginger-base
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=()
pkgname=('ginger-base')

# Version
pkgver=2.3.0
pkgrel=2
#epoch=

# Generic
pkgdesc="Basic host management plugin for WoK"
arch=('any')
url="https://github.com/kimchi-project/gingerbase"
license=('LGPL' 'Apache')
groups=('kimchi-project')

# Dependencies
depends=('python2-configobj'
         'python2-pyparted'
         'wokd')
optdepends=('sos: sosreport support')
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
sha256sums=('c120e3e809300c156c478810f1201d4c680c1c3b651bae15555f6ed23506e544')

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
