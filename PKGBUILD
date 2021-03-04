# Maintainer: kugland <kugland at gmail dot com>

pkgname=rndstr
pkgver=1.0.1
pkgrel=1
pkgdesc="Generate random strings in shell"
arch=('any')
url="https://github.com/kugland/rndstr"
license=('MIT')
depends=(bash bc)
makedepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/kugland/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('164a8d6dd71bf56746704851219e886558e339afb01832a286a9b3d309686927')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cat rndstr.1 | gzip -9 >rndstr.1.gz
  install -D -m 755 -o root -g root rndstr "$pkgdir/usr/bin/rndstr"
  install -D -m 644 -o root -g root rndstr.1.gz "${pkgdir}/usr/share/man/man1/rndstr.1.gz"
  install -D -m 644 -o root -g root LICENSE "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
  install -D -m 644 -o root -g root README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
