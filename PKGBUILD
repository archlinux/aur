# Maintainer: wookietreiber <kizkizzbangbang@googlemail.com>

pkgname=strace-analyzer
pkgver=0.1.0
pkgrel=1
pkgdesc="analyzes strace output"
arch=(any)
url="https://github.com/wookietreiber/strace-analyzer"
license=('GPL')
depends=('java-environment' 'bash')
source=("https://github.com/wookietreiber/strace-analyzer/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('f2cbb3343343217a4756a85aadb16302')

package() {
  cd $srcdir/$pkgname-$pkgver

  install -Dm755 bin/strace-analyzer $pkgdir/usr/share/$pkgname/bin/strace-analyzer

  for jar in lib/* ; do
    install -Dm644 $jar $pkgdir/usr/share/$pkgname/$jar
  done

  install -Dm644 share/$pkgname/NOTICE.md $pkgdir/usr/share/$pkgname/NOTICE.md

  install -d $pkgdir/usr/bin
  cd $pkgdir/usr/bin
  ln -s ../share/$pkgname/bin/strace-analyzer
}
