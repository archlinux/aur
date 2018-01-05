# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Masami Ichikawae <masami256@gmail.com>
pkgname=ebizzy
pkgver=0.3
pkgrel=3
pkgdesc='Generate a workload resembling common web application server workloads'
arch=('x86_64')
url="http://ebizzy.sourceforge.net/"
license=('GPL2')
depends=('glibc')
source=('https://downloads.sourceforge.net/project/ebizzy/ebizzy/0.3/ebizzy-0.3.tar.gz'
        Makefile)
sha1sums=('e1a8afc36a68a4ea79ad5ec8f786a06d614d8ca5'
          '51da05091701e4a2ecc3be9ba638de235f596755')

build() {
  cd $pkgname-$pkgver
  make -f ../Makefile
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm 644 README "$pkgdir/usr/share/$pkgname/README"
}

check() {
  cd $pkgname-$pkgver
  ./ebizzy
}
