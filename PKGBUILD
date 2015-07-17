# Maintainer: peter1000 <https://github.com/peter1000>
# Contributor: David Roheim <david dot roheim at gmail dot com>
# Contributor: Leonard de Ruijter <leonard@aur.archlinux.org>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

_srcname=vo-aacenc
pkgname=${_srcname}_p
pkgver=0.1.3
pkgrel=1
pkgdesc="VisualOn Advanced Audio Coding (AAC) encoder"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opencore-amr/"
license=('APACHE')
depends=('glibc')
options=('!emptydirs' '!libtool')
conflicts=('vo-aacenc')
provides=('vo-aacenc')
replaces=()
source=("http://downloads.sourceforge.net/opencore-amr/${_srcname}-${pkgver}.tar.gz")
sha256sums=('e51a7477a359f18df7c4f82d195dab4e14e7414cbd48cf79cc195fc446850f36')

build() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package () {
  cd "${srcdir}/${_srcname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}

