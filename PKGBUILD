# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=lxsplit
pkgver=0.2.4
pkgrel=2
pkgdesc="Command-line file splitter/joiner compatible with any HJSplit version"
arch=('i686' 'x86_64')
url="http://lxsplit.sourceforge.net/"
license=('GPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/sourceforge/lxsplit/lxsplit-${pkgver}.tar.gz")
md5sums=('ed21a08c167c08d4d81c820782947cb1')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -d ${pkgdir}/usr/bin
  make INSTALL_PATH=${pkgdir}/usr/bin install
}
