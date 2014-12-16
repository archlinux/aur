#Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=icdiff
pkgver=1.7.1
pkgrel=1
pkgdesc="Improved colored diff"
arch=('any')
depends=('python')
url="https://github.com/jeffkaufman/icdiff"
license=('PSF')
source=($pkgname-$pkgver.tar.gz::https://github.com/jeffkaufman/icdiff/archive/release-$pkgver.tar.gz)
sha256sums=('df311a134272d811e68f6ac20546972ec80693a12d8b27af423e39f0830bca9e')

package() {
  cd $pkgname-release-$pkgver

  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md

  for _bin in git-icdiff icdiff; do
    install -Dm755 $_bin "$pkgdir"/usr/bin/$_bin
  done
}
