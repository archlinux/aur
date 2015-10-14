# Maintainer: manuel alcocer <m.alcocer1978@gmail.com>

_pkgbase=kylixlibs
pkgname=lib32-$_pkgbase
pkgver=3.0
pkgrel=2
pkgdesc="Libraries from Borland's IDE Kylix (32 bit)"
arch=('x86_64')
url="http://kylixlibs.sourceforge.net/index.html"
license=('GPL' 'LGPL')
depends=('lib32-libxext' 'lib32-libjpeg6-turbo' 'lib32-libsm' 'lib32-zlib')
_downloadurl=http://downloads.sourceforge.net/kylixlibs
source=($_downloadurl/${_pkgbase}3-borqt_$pkgver-1_i386.deb
        $_downloadurl/${_pkgbase}3-borstlcrtl_$pkgver-1_i386.deb
        $_downloadurl/${_pkgbase}3-qt_$pkgver-1_i386.deb
        $_downloadurl/${_pkgbase}3-runtime_$pkgver-1_i386.deb
        $_downloadurl/${_pkgbase}3-unwind_$pkgver-1_i386.deb)
md5sums=('c0ce0a841dbebb491834ccd3804fab84'
         '0948965c4d337f55cd9a1d987775cb12'
         '900bc6dce09e29db83a0f1854d9e9dee'
         'c27428edb5f177969acf52b0dde3ca72'
         'dd5ef60858d9c3f4524337bbd384d11f')

package() {
  cd "${srcdir}"
  for i in borqt borstlcrtl qt runtime unwind; do
    ar xo ${_pkgbase}3-${i}_${pkgver}-1_i386.deb
    tar xf data.tar.gz -C "${pkgdir}"
  done
  mv "${pkgdir}"/usr/lib{,32}
}
