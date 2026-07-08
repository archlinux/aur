# Maintainer: Matt Shearing <matt@block-sense.io>
pkgname=signet-pdf
pkgver=1.0.1
pkgrel=1
pkgdesc='A tiny, fully-local offline PDF signer — open a PDF, drop your signature, done'
arch=('any')
url='https://github.com/matt-shearing/signet'
license=('MIT')
depends=('python')
optdepends=('firefox: no-server signing via file://'
            'chromium: signing via an ephemeral loopback server')
source=("$pkgname-$pkgver.tar.gz::https://github.com/matt-shearing/signet/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fc7fbd9f9b73d3d64130f639ccdf118ea716a845ffbcaa4812ae0b29faff3347')

package() {
  cd "$srcdir/signet-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr NAME=signet-pdf install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
