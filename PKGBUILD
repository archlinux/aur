# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=assemblyscript
pkgver=0.12.4
pkgrel=1
pkgdesc="TypeScript to WebAssembly compiler"
arch=('any')
url="https://assemblyscript.org/"
license=('apache')
depends=('nodejs')
makedepends=('git' 'npm')
source=("git+https://github.com/AssemblyScript/assemblyscript.git#tag=v$pkgver")
sha256sums=('SKIP')


package() {
  cd "assemblyscript"

  npm install -g --user root --prefix="$pkgdir/usr" git+file://$(pwd)

  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  chown -R root:root "$pkgdir"
}
