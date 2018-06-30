# Maintainer: Travis Glenn Hansen <travisghansen@yahoo.com>

pkgname=slimerjs
pkgver=1.0.0
pkgrel=1
pkgdesc="A scriptable browser for Web developers"
arch=('any')
url="https://slimerjs.org/"
license=('MPL2')
depends=('firefox' 'nodejs' 'python')
optdepends=()
makedepends=()
conflicts=()
provides=()
source=("https://download.slimerjs.org/releases/${pkgver//_/-}/${pkgname}-${pkgver//_/-}.tar.bz2")
sha256sums=('466f84ce302b7c2062176a5b26c8cfd77fad91cde95a369aa6794ccb27cfc546')


package() {
  mkdir -p "$pkgdir/opt"
  cp -a "$srcdir/${pkgname}-${pkgver//_/-}" "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  ln -sf /opt/$pkgname/slimerjs $pkgdir/usr/bin/slimerjs
  install -Dm644 "$srcdir/${pkgname}-${pkgver//_/-}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
