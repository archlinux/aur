# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Christian Neukirchen <chneukirchen@gmail.com>
# Contributor: Thomas Weißschuh <thomas_weissschuh lavabit.com>

pkgname=mosh
pkgver=1.2
pkgrel=1
pkgdesc='Mobile shell, surviving disconnects with local echo and line editing'
arch=('x86_64' 'i686')
url="http://mosh.mit.edu/"
license=('GPL3')
depends=('protobuf' 'ncurses' 'zlib' 'openssh' 'perl' 'perl-io-tty')
#optdepends=('libutempter: record of session in {u,t}wmp (recompile mosh afterwards)')
conflicts=('mosh-git')
source=("$pkgname-$pkgver.tgz::https://nodeload.github.com/keithw/mosh/tarball/master")
sha1sums=('690e301560808f13a8a7b19bd7740d81fecac262')

build() {
  cd "$srcdir/keithw-mosh-"*

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/keithw-mosh-"*

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
