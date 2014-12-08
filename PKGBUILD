#Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=icdiff
pkgver=1.2.1
pkgrel=1
pkgdesc="Improved colored diff"
arch=('any')
depends=('python')
url="https://github.com/jeffkaufman/icdiff"
license=('PSF')
source=($pkgname-$pkgver.tar.gz::https://github.com/jeffkaufman/icdiff/archive/release-$pkgver.tar.gz)
sha256sums=('0f4a9886626e4da77927e7417990c234b97878f7b802890d13aafadd060d05a8')

package() {
  cd $pkgname-release-$pkgver

  install -Dm644 README "$pkgdir"/usr/share/doc/icdiff/README

  for _bin in git-icdiff icdiff; do
    install -Dm755 $_bin "$pkgdir"/usr/bin/$_bin
  done
}
