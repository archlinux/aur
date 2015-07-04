# Contributor: Dave Reisner <d@falconindy.com>

pkgname=pkgfile-git
pkgver=15.7.g7ace342
pkgrel=1
pkgdesc="a pacman .files metadata explorer"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/pkgfile"
license=('MIT')
depends=('libarchive' 'curl' 'pcre' 'pacman')
makedepends=('git' 'perl')
conflicts=('pkgfile' 'nosr')
provides=('pkgfile' 'nosr')
replaces=('nosr-git')
install=pkgfile.install
source=("git://github.com/falconindy/pkgfile")
md5sums=('SKIP')

pkgver() {
  cd pkgfile
  git describe | sed 's/^v//;s/-/./g'
}

build() {
  cd pkgfile

  ./autogen.sh
  ./configure
  make
}

package() {
  make -C pkgfile DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
