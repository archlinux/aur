# Maintainer: Matt Harrison <matt@harrison.us.com>

pkgname=go.rice
pkgver=1.0.0
pkgrel=1
pkgdesc='Go package that makes working with resources such as html,js,css,images,templates, etc very easy.'
arch=(x86_64)
url='https://statping.com/'
license=("BSD")
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::https://github.com/GeertJohan/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('540cb64258fc2422664c73454b5dbaac5487a45906c935d25285a2a60085d877')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver/rice"
  go build -a
}

package() {
  install -D -m 0755 "$srcdir/$pkgname-$pkgver/rice/rice" "$pkgdir/usr/bin/rice"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
