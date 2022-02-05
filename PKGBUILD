# Maintainer: André Kugland <kugland at gmail dot com>

pkgname=nojail
pkgver=1.0.1
pkgrel=1
pkgdesc="Script to execute binaries outside firejail"
arch=(any)
url="https://github.com/kugland/$pkgname"
license=('MIT')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d945a1f0afb3a91cce8aeb90738aa5d6e8d41ab28f3431af0645336d35090159')

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -m 755 -o 0 -g 0 -D -t $pkgdir/usr/bin/ nojail
  install -m 644 -o 0 -g 0 -D -t $pkgdir/usr/share/doc/nojail/ README.md LICENSE
  install -m 644 -o 0 -g 0 -D -t $pkgdir/usr/share/zsh/site-functions/ _nojail
}
