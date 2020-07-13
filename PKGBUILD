# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=swayout
pkgver=1
pkgrel=2
pkgdesc="A simple bash script which helps organizing multiple sway output profiles "
arch=('any')
url="https://git.sr.ht/~rumpelsepp/swayout"
license=('GPL3')
makedepends=('asciidoctor')
depends=('sway' 'jq')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~rumpelsepp/swayout/archive/v${pkgver}.tar.gz")
sha256sums=('44c5c8a9420c7760409b2eb136611040988cb616aee579a7a4dde6b153fd1399')

build() {
  cd $srcdir/$pkgname-v$pkgver/man
  make
}

package() {
  cd $srcdir/$pkgname-v$pkgver
  install -D -m 755 swayout $pkgdir/usr/bin/swayout
  install -D -m 644 man/swayout.1 $pkgdir/usr/share/man/man1/swayout.1
  install -D -m 644 contrib/swayout.fish "${pkgdir}/usr/share/fish/vendor_completions.d/swayout.fish"
}
