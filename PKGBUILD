# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=bun
pkgver=0.0.77
pkgrel=1
pkgdesc="A runtime for JavaScript and TypeScript"
arch=(x86_64)
url="https://github.com/Jarred-Sumner/bun-releases-for-updater"
license=(MIT)
provides=(bun)
source=(${pkgname}-${pkgver}.zip::$url/releases/download/$pkgname-v$pkgver/$pkgname-linux-x64.zip)
sha256sums=('68101e1696e969db59f1a70529bc5091ad21b9e343d9b6db05f28a8d63cc2d37')

package() {
  cd "$srcdir/$pkgname-linux-x64"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp bun "$pkgdir/usr/lib/$pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/$pkgname/bun $pkgdir/usr/bin/$pkgname
}
