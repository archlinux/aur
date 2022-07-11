# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=bun
pkgver=0.1.3
pkgrel=2
pkgdesc="A runtime for JavaScript and TypeScript"
arch=(x86_64)
url="https://github.com/Jarred-Sumner/bun-releases-for-updater"
license=(MIT)
provides=(bun)
source=(${pkgname}-${pkgver}.zip::$url/releases/download/$pkgname-v$pkgver/$pkgname-linux-x64.zip)
sha256sums=('b82a978e48acfea6f027b29f71a1c789f06b408c2e7d79ff100d30f016c41771')

package() {
  cd "$srcdir/$pkgname-linux-x64"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp bun "$pkgdir/usr/lib/$pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/$pkgname/bun $pkgdir/usr/bin/$pkgname
}
