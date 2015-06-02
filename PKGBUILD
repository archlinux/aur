# Maintainer: Leonard de Ruijter <leonard@aur.archlinux.org>
pkgname=mod_musicindex
pkgver=1.4.1
pkgrel=1
pkgdesc="An Apache module which allows nice displaying of directories containing MP3, FLAC, Ogg Vorbis or MP4/AAC files."
url="http://hacks.slashdirt.org/musicindex/"
arch=('i686' 'x86_64')
options=('!strip')
license=('LGPL2.1')
depends=('apache' 'flac' 'libarchive' 'libid3tag' 'libmad' 'libmariadbclient' 'libmp4v2' 'libvorbis')
source=(http://hacks.slashdirt.org/musicindex/$pkgname-$pkgver.tar.gz)
md5sums=('cf758050b689fe16c5ff8f8c5da5cfa4')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --datarootdir=/usr/share/ 
  make all
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
