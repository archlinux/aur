# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=assemblyscript
pkgver=0.19.8
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
sha256sums=('1f66b62d23cf5791bfb1481411b79046b9ce1f1c11c21c6d3cb5a5a1fcd423ef')


package() {
  npm install -g --user root --prefix="$pkgdir/usr" "assemblyscript-$pkgver.tgz"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  chown -R root:root "$pkgdir"
}
