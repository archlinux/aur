# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=casperjs
pkgver=1.1.3
pkgrel=1
pkgdesc="a browser navigation scripting & testing utility written in Javascript on top of PhantomJS."
arch=('any')
url="http://casperjs.org/"
license=('MIT')
depends=('python' 'phantomjs')
optdepends=('ruby')
makedepends=()
conflicts=()
provides=()
source=("https://github.com/casperjs/casperjs/archive/${pkgver}.tar.gz")
sha256sums=('3e9c385a2e3124a44728b24d3b4cad05a48e2b3827e9350bdfe11c9a6d4a4298')


package() {
  mkdir -p "$pkgdir/opt"
  cp -a "$srcdir/casperjs-$pkgver" "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  ln -sf /opt/$pkgname/bin/casperjs $pkgdir/usr/bin/casperjs
  install -Dm644 "$srcdir/casperjs-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
