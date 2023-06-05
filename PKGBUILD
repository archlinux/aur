# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgname=lyricstify
pkgver=1.1.2
pkgrel=1
pkgdesc="Synchronized Spotify lyrics in the terminal"
url="https://github.com/lyricstify/lyricstify"
license=("MIT")
arch=("any")
depends=("nodejs")
makedepends=("npm")
# To determine source, run: npm view @lyricstify/lyricstify dist.tarball
source=("https://registry.npmjs.org/@$pkgname/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=("31e08cfc5c4bdbd890ad469c0a284a65565a6ddf9c3c10958307e9702540d6e7")

prepare() {
  tar xf "$pkgname-$pkgver.tgz" package/LICENSE
}

package() {
  npm i -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  chown -R root:root "$pkgdir"
  install -Dm644 "package/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
