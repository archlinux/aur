# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-dnc
_pkgname=dnc
pkgver=0.2.0
pkgrel=2
pkgdesc="A tool to check domain names configuration"
arch=('any')
url="https://github.com/fcambus/dnc"
license=('BSD')
depends=('python' 'python-pyopenssl' 'python-prettytable' 'python-dnspython>=2.0.0')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('ff12ae9061076ace604ee0ef201ba3fe4f338204267e0d724bf3d026952599ea784b4c4bd35cf40a8b134cd84f13354c4a332da5e3d662efba361f0af09a9ee8')

package() {
  cd "$_pkgname-$pkgver"

  # script
  install -vDm755 -t "$pkgdir/usr/bin" dnc

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md AUTHORS ChangeLog
  install -vDm644 -t "$pkgdir/usr/share/man/man1" dnc.1

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
