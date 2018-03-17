# Maintainer: Travis Glenn Hansen <travisghansen@yahoo.com>

pkgname=casperjs
pkgver=1.1.4_2
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
source=("https://github.com/casperjs/casperjs/archive/${pkgver//_/-}.tar.gz")
sha256sums=('239b9c95c0e4ab534a3939a8769b5a552315b986472dee967850a407e9b60062')


package() {
  mkdir -p "$pkgdir/opt"
  cp -a "$srcdir/casperjs-${pkgver//_/-}" "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  ln -sf /opt/$pkgname/bin/casperjs $pkgdir/usr/bin/casperjs
  install -Dm644 "$srcdir/casperjs-${pkgver//_/-}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
