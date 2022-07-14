# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>

_pkgbase=serve
pkgname=nodejs-$_pkgbase
pkgdesc='Quick HTTP server'
pkgver=14.0.1
pkgrel=1
arch=('any')
url='https://github.com/zeit/serve'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_pkgbase/-/$_pkgbase-$pkgver.tgz)
noextract=($_pkgbase-$pkgver.tgz)

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_pkgbase-$pkgver.tgz
  rm -fr "$pkgdir"/usr/etc

  # Fix npm derp
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
}

sha512sums=('b4d1b0c65dbb17003c4db98c42a3748d3692c7cfedacbe77daa66c2475f555d8842238ed3091c2b3b0054ba3afb42edc4c73af9a35eab79c9ccde8d4e825765e')
