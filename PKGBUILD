# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Justin Dray <justin@dray.be>
# Contributor: David Roheim <david dot roheim at gmail dot com>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

_pkgname='opencore-amr'
pkgname=vo-aacenc
pkgver=0.1.5
pkgrel=1
pkgdesc="VisualOn Advanced Audio Coding (AAC) encoder"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://sourceforge.net/projects/$_pkgname/"
license=('APACHE')
depends=('glibc')
options=('!emptydirs' '!libtool')
source=("https://sourceforge.net/projects/opencore-amr/files/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('2c006cb9d5f651bfb5e60156dbff6af3c9d35c7bbcc9015308c0aff1e14cd341')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package () {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

