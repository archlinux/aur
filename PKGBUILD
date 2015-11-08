# Maintainer: <kfgz at interia dot pl>

pkgname=divx265
pkgver=1.5.8
_pkgver="${pkgver:0:1}_${pkgver:2:1}_${pkgver:4:1}"
pkgrel=1
pkgdesc="Free for non commercial use H265/HEVC video encoder"
arch=('i686' 'x86_64')
url="http://labs.divx.com/divx265/"
license=('other')
options=(!strip)
source=(DivX265::http://download.divx.com/hevc/DivX265_${_pkgver}
        DivX265.1)
md5sums=('3cb04e8cf69ad7d63e5001c882f2b4a3'
         'd24e50a151d8951b0e996ce60b70c6d4')

if [[ $CARCH == i686 ]]; then
  depends=(gcc-libs)
  else
  depends=(lib32-gcc-libs)
fi

package() {
  install -Dm755 "${srcdir}"/DivX265 "${pkgdir}"/usr/bin/DivX265
  install -Dm644 "${srcdir}"/DivX265.1 "${pkgdir}"/usr/share/man/man1/divx265.1  
}
