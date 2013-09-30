# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: joyfulgirl@archlinux.us
# Contributor: nathan owe ndowens04 at gmail dot com

pkgname=cclive
pkgver=0.9.2
pkgrel=1
pkgdesc='Commandline downloader for popular video websites.'
arch=('i686' 'x86_64')
url='http://cclive.sourceforge.net/'
license=('AGPL3')
depends=('boost-libs' 'pcre' 'curl' 'libquvi' 'glibmm')
makedepends=('boost')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz")
md5sums=('b21f2ed68242901dc0439132a4ea6629')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr boost_cv_rpath_link_ldflag="-L/usr/lib"
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
