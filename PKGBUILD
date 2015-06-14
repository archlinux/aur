# Maintainer: Immae <ismael.bouya@normalesup.org>

pkgname=ejabberd-mod_mam
pkgver=20150518
pkgrel=1
pkgdesc="Message Archive Management for ejabberd"
arch=(any)
url="http://www.ejabberd.im/ejabberd-modules"
license=('GPL')
depends=(ejabberd)
makedepends=(erlang-nox git)
options=()
source=("git://github.com/processone/ejabberd-contrib.git")
sha1sums=('SKIP')

build() {
  cd $srcdir/ejabberd-contrib/mod_mam
  mkdir ebin
  erlc -o ebin -I include -I /usr/lib/ejabberd/include/ -DNO_EXT_LIB src/mod_mam.erl
}

package() {
  cd $srcdir/ejabberd-contrib/mod_mam
  install -d -m 0755 $pkgdir/usr/lib/ejabberd
  cp -r ebin $pkgdir/usr/lib/ejabberd/ebin
}

