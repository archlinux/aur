# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=assemblyscript
pkgver=0.26.5
pkgrel=1
pkgdesc="TypeScript to WebAssembly compiler"
arch=('any')
url="https://assemblyscript.org/"
license=('apache')
depends=('nodejs')
makedepends=('npm')
conflicts=('typescript')
source=("https://registry.npmjs.org/assemblyscript/-/assemblyscript-$pkgver.tgz")
noextract=("assemblyscript-$pkgver.tgz")
sha256sums=('1b44c4d6d32ea5b3f453e88c150924373d29b0e5379f9d814ffadb7fa1d0ee11')


package() {
  npm install -g --user root --prefix="$pkgdir/usr" "assemblyscript-$pkgver.tgz"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  chown -R root:root "$pkgdir"
}
