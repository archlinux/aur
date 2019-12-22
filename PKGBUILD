# Maintainer: Vincent B. <vb AT luminar.eu.org>
pkgname=klong
pkgver=20190926
pkgrel=1
pkgdesc="A simple array language"
arch=('armv7h' 'aarch64' 'x86_64')
url="http://t3x.org/klong"
license=("CC0")
source=("http://t3x.org/klong/klong${pkgver}.tgz")
md5sums=('d03ed117cc8b9fadc87c1dd68b7fe7ec')

build() {
  cd ${srcdir}/${pkgname}
  make
}

check() {
  cd ${srcdir}/${pkgname}
  make test
}

package() {
  mkdir -p ${pkgdir}/usr/{bin,lib}
  cp ${srcdir}/${pkgname}/{kg,kplot} ${pkgdir}/usr/bin
  cp -a ${srcdir}/${pkgname}/lib ${pkgdir}/usr/lib/klong
}
