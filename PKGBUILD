# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=passh
pkgver=1.0.2
pkgrel=1
pkgdesc="interactive keyboard password authentication for SSH"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/clarkwang/passh"

source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('40ea6f141cd52fcf354f9b78a553010d9f94704b1a3b3c25842f017c4fe21e10')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 passh "$pkgdir/usr/bin/passh"

  install -Dm644 README.md "$pkgdir/usr/share/doc/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
