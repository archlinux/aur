#Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=icdiff
pkgver=1.9.1
pkgrel=1
pkgdesc="Improved colored diff"
arch=('any')
depends=('python')
url="https://github.com/jeffkaufman/icdiff"
license=('PSF')
source=($pkgname-$pkgver.tar.gz::https://github.com/jeffkaufman/icdiff/archive/release-$pkgver.tar.gz)
sha256sums=('18cf11866150eba1ecec1370611921246918310f4b5cb101045db523a05fb37d')

package() {
  cd $pkgname-release-$pkgver

  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md

  for _bin in git-icdiff icdiff; do
    install -Dm755 $_bin "$pkgdir"/usr/bin/$_bin
  done
}
