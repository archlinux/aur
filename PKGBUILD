# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/casperjs

pkgname=casperjs
pkgver=1.0.2
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
source=("https://github.com/n1k0/${pkgname}/tarball/${pkgver}")
sha256sums=('801c3417567bfebde7ec252aeb30cfde188e8cd7bbbc63d67b795c2bdc672101')


package() {
  install -d "$pkgdir/opt/"
  cp -dpr --no-preserve=ownership "$srcdir/n1k0-casperjs-bc0da16" "$pkgdir/opt/$pkgname"
  install -d "$pkgdir/usr/bin"
  ln -sf /opt/$pkgname/bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/n1k0-casperjs-bc0da16/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
