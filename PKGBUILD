# Maintainer: Felix Yan <felixonmars@gmail.com>
# Contributor: imagelife <lovelinux229@gmail.com>
pkgname=ruijieclient
pkgver=1.0_rc1
_filename=$pkgname-1.0-rc1
pkgrel=1
pkgdesc="A More Powerful Ruijie Supplicant For GNU/Linux"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ruijieclient/"
license=('LGPL3')
depends=('libpcap' 'libxml2')
source=(http://ruijieclient.googlecode.com/files/$_filename.tar.gz)
md5sums=('f1e343e4422d67d723a16e7fde977c16')

build() {
  cd "${srcdir}/${_filename}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_filename}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
