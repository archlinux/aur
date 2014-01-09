# Maintainer: Matt Harrison <matt@mistbyte.com>
# This PKGBUILD is maintained at https://github.com/matt-h/aur-pkgbuilds/tree/master/casperjs

pkgname=casperjs
pkgver=1.0.4
pkgrel=1
pkgdesc="a browser navigation scripting & testing utility written in Javascript on top of PhantomJS."
arch=('any')
url="http://casperjs.org/"
license=('MIT')
depends=('python' 'phantomjs-1.8')
optdepends=('ruby')
makedepends=()
conflicts=()
provides=()
source=("https://github.com/n1k0/${pkgname}/tarball/${pkgver}")
sha256sums=('bc51012f68bb8bb8fea3acbfd7fff8e8541ae43c4d25744d505457042919a915')


package() {
  install -d "$pkgdir/opt/"
  cp -dpr --no-preserve=ownership "$srcdir/n1k0-casperjs-e3a77d0" "$pkgdir/opt/$pkgname"
  install -d "$pkgdir/usr/bin"
  ln -sf /opt/$pkgname/bin/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/n1k0-casperjs-e3a77d0/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
