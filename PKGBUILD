# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# ginger-base
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=()
pkgname=('ginger-base')

# Version
pkgver=2.1.0
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
         'wok')
#optdepends=()
makedepends=('git')
#checkdepends=()

# Package Relations
provides=('ginger-base')
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
sha256sums=('1b9b02dc64187cfff5fc0a7a548087da197a1b2193ce408f1354e9666695e937')

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
