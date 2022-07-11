# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=bun
pkgver=0.1.3
pkgrel=1
pkgdesc="A runtime for JavaScript and TypeScript"
arch=(x86_64)
url="https://github.com/Jarred-Sumner/bun-releases-for-updater"
license=(MIT)
provides=(bun)
source=(${pkgname}-${pkgver}.zip::$url/releases/download/$pkgname-v$pkgver/$pkgname-linux-x64.zip)
sha256sums=('3b307b3d546b6f3737aabb2be699cae1883603c86471a7561bc311ef321e8c57')

package() {
  cd "$srcdir/$pkgname-linux-x64"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp bun "$pkgdir/usr/lib/$pkgname/"

  install -d "$pkgdir/usr/bin"
  ln -s /usr/lib/$pkgname/bun $pkgdir/usr/bin/$pkgname
}
