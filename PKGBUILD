# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=bun
pkgver=0.0.83
pkgrel=1
pkgdesc="A runtime for JavaScript and TypeScript"
arch=(x86_64)
url="https://github.com/Jarred-Sumner/bun-releases-for-updater"
license=(MIT)
provides=(bun)
source=(${pkgname}-${pkgver}.zip::$url/releases/download/$pkgname-v$pkgver/$pkgname-linux-x64.zip)
sha256sums=('7092322b4426d7f530833721c30c63fe22c3385ab57ebe60acecb3da08f64288')

package() {
  cd "$srcdir/$pkgname-linux-x64"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp bun "$pkgdir/usr/lib/$pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/$pkgname/bun $pkgdir/usr/bin/$pkgname
}
