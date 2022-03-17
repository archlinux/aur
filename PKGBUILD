# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=bun
pkgver=0.0.73
pkgrel=1
pkgdesc="A runtime for JavaScript and TypeScript"
arch=(x86_64)
url="https://github.com/Jarred-Sumner/bun-releases-for-updater"
license=(MIT)
provides=(bun)
source=(${pkgname}-${pkgver}.zip::$url/releases/download/$pkgname-v$pkgver/$pkgname-linux-x64.zip)
sha256sums=('5ca20a23d5631ee610229a19a044ae7b38f8ba41b0edef3f824f9a2be0de87b8')

package() {
  cd "$srcdir/$pkgname-linux-x64"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp bun "$pkgdir/usr/lib/$pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/$pkgname/bun $pkgdir/usr/bin/$pkgname
}
