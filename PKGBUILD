# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Dominic Brekau <aur@dominic.brekau.de>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=ucommon
pkgver=7.0.1
pkgrel=1
pkgdesc='GNU Common C++ is a class framework that was specifically designed for telephony applications.'
arch=('i686' 'x86_64')
url='https://www.gnu.org/software/commoncpp/'
license=('LGPL3')
depends=('openssl')
makedepends=('cmake')
#source=("https://ftp.gnu.org/gnu/commoncpp/$pkgname-$pkgver.tar.gz"{,.sig})
source=("https://git.savannah.gnu.org/cgit/commoncpp.git/snapshot/commoncpp-$pkgver.tar.gz")
sha256sums=('99fd0e2c69f24e4ca93d01a14bc3fc4e40d69576f235f80f7a8ab37c16951f3e')
#validpgpkeys=('5CF995AAD5CC1E4079F76C38B1732A9CB37C87BA')

build() {
  mkdir build && cd build
  cmake "${srcdir}"/commoncpp-$pkgver -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
