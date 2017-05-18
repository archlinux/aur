# Maintainer: Abdelhakim Qbaich <abdelhakim@qbaich.com>

pkgname=ponzu
pkgver=0.9.2
pkgrel=1
pkgdesc='Headless CMS with automatic JSON API. Featuring auto HTTPS, HTTP/2 Server Push, and flexible server framework written in Go.'
arch=('i686' 'x86_64')
url='https://ponzu-cms.org'
license=('BSD')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ponzu-cms/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f9343e75c8673591afc304072c0adb4445c3865782a1b387f7e6abc00d40f79b')

build() {
  cd "$pkgname-$pkgver/cmd/ponzu"

  go build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "cmd/ponzu/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
