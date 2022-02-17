# Maintainer: Vincent B. <vb AT luminar.eu.org>
pkgname=klong
pkgver=20200403
pkgrel=1
pkgdesc="A simple array language"
arch=('armv7h' 'aarch64' 'x86_64')
url="http://t3x.org/klong"
license=("CC0")
source=("http://t3x.org/klong/klong${pkgver}.tgz")
sha256sums=('0f349db737f375c42f0ce0fda05d3a5627fb1627d7422c5fc84680ec9a936dfd')

build() {
  cd ${srcdir}/${pkgname}
  make
}

check() {
  cd ${srcdir}/${pkgname}
  KLONGPATH=. make test
}

package() {
  mkdir -p ${pkgdir}/usr/{bin,lib}
  cp ${srcdir}/${pkgname}/{kg,kplot} ${pkgdir}/usr/bin
  cp -a ${srcdir}/${pkgname}/lib ${pkgdir}/usr/lib/klong
}
