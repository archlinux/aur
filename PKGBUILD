# Maintainer: AG_Caesar <caesar[at]drachenhain[dot]net>
pkgname=ovito
pkgver=2.6.2
pkgrel=1
pkgdesc="OVITO is a scientific visualization and analysis software for atomistic simulation data."
url="http://www.ovito.org"
arch=('x86_64' 'i686')
license=('GPL3')
md5sums=('')
source=("http://www.ovito.org/download/$pkgver/$pkgname-$pkgver-$CARCH.tar.gz")

if [[ $CARCH = i686 ]];then
  md5sums[0]='a111bac521bd350ce1049e785461002b'
else
  md5sums[0]='f75d142736367d26e63eafbf31a1ceba'
fi

package() {
  cd ${pkgname}-${pkgver}-$CARCH
  install -d ${pkgdir}/usr
  rm -rf LICENSE.txt README.txt
  cp -dpr --no-preserve=ownership ./* ${pkgdir}/usr
}
