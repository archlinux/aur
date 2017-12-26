# $Id$
# Maintainer : speps <speps at aur dot archlinux dot org>

pkgname=glee
pkgver=5.4.0
pkgrel=3
pkgdesc="Free cross-platform extension loading library for OpenGL"
arch=('x86_64')
url="http://elf-stone.com/glee.php"
license=('custom:BSD')
depends=('gcc-libs' 'libgl')
makedepends=('mesa')
#source=("http://elf-stone.com/downloads/GLee/GLee-$pkgver-src.tar.gz")
md5sums=('0bd03db136dbc075488b6c6e83f326ae'
         '937a48856486291070943488fa2824d0'
         'b59e8d11402fb2ee6c4a92bf6916b3aa')
_spkg=GLee-$pkgver-src.tar.gz
source=("http://pkgs.fedoraproject.org/repo/pkgs/GLee/$_spkg/$md5sums/$_spkg"
        glee.pc Makefile) # implement FS#32670 + fix TEXTREL for i686

build() {
  make
}

package() {
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
