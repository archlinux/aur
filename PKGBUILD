# Maintainer: kfgz <kfgz at interia dot pl>
# Contributor: Philipp 'TamCore' B. <philipp at tamcore dot eu>

pkgname=stressapptest
pkgver=1.0.7
pkgrel=1
pkgdesc="Stressful Application Test (or stressapptest, its unix name)"
url="http://code.google.com/p/stressapptest/"
license=('APACHE')
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libaio')
makedepends=('subversion')
source=(svn+http://stressapptest.googlecode.com/svn/trunk/)
md5sums=('SKIP')

build() {
  cd "${srcdir}"/trunk
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/trunk
  make DESTDIR="${pkgdir}" install
}
