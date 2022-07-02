# Maintainer: Tyler Langlois <ty |at| tjll |dot| net>

pkgname=overdue
pkgver=1.1.1
pkgrel=1
pkgdesc="Get notified about running daemons that reference outdated shared libraries"
arch=('any')
url="https://github.com/tylerjl/$pkgname"
license=('MIT')
depends=('lsof')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tylerjl/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c783356275f02369a5dc8d049bbb6ee18ec3bda1995800036627a226fe2d9b9f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=$pkgdir install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
