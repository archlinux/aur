# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=passh
pkgver=1.0.1
pkgrel=1
pkgdesc="interactive keyboard password authentication for SSH"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/clarkwang/passh"

source=($pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('f6efc7127515b3716108fa28439caca561d16923404bb1a8f734b41340b3f14e')

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
