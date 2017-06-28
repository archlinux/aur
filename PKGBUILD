# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=ucommon
pkgver=7.0.0
pkgrel=1
pkgdesc="A light-weight C++ library to facilitate using C++ design patterns"
arch=('i686' 'x86_64')
url="http://www.gnutelephony.org/index.php/GNU_uCommon_C++"
license=('LGPL3')
depends=('gnutls')
source=("http://ftp.gnu.org/pub/gnu/commoncpp/$pkgname-$pkgver.tar.gz"{,.sig})
md5sums=('90468af8f6692f0b6576189927414a39'
         'SKIP')
validpgpkeys=('5CF995AAD5CC1E4079F76C38B1732A9CB37C87BA')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-sslstack=gnu --enable-socks --enable-stdcpp --enable-atomics --with-pkg-config
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
