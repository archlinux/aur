# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: joyfulgirl@archlinux.us
# Contributor: nathan owe ndowens04 at gmail dot com

pkgname=cclive
pkgver=0.7.10
pkgrel=1
pkgdesc='Commandline downloader for popular video websites.'
arch=('i686' 'x86_64')
url='http://cclive.sourceforge.net/'
license=('GPL3')
depends=('boost-libs' 'pcre' 'curl' 'libquvi')
makedepends=('boost')
source=("http://downloads.sourceforge.net/project/${pkgname}/0.7/${pkgname}-${pkgver}.tar.xz")
md5sums=('dee09cd1b5638078037b8a2945ebac52')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
