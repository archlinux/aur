pkgname=mcugen
pkgver=0.1.3
pkgrel=1
pkgdesc="Material 3 color generator CLI"
arch=('any')
url="https://github.com/MeghBadonia/mcugen"
license=('MIT')

depends=('nodejs>=18' 'libvips')
makedepends=('npm')

source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/mcugen/-/mcugen-$pkgver.tgz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/package"
  npm install --production --ignore-scripts
}

package() {
  cd "$srcdir/package"

  install -d "$pkgdir/usr/lib/$pkgname"
  cp -r . "$pkgdir/usr/lib/$pkgname"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/bin/mcugen.js" "$pkgdir/usr/bin/mcugen"
}
