# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
pkgname=pcstat
pkgver=0.0.2
pkgrel=1
pkgdesc="Utility to get page cache stats for files"
arch=('x86_64')
url="https://github.com/tobert/pcstat"
license=('Apache-2.0')
makedepends=(go)

source=("https://github.com/tobert/pcstat/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('935f120668c1f208aaad01bfd808edfcd1113c22d7a3473e7ea531a6d793860ea5923098ce01a8d766e9545dda90aef1c197a4590fd2cb24f3c00e62a3678733')

build() {
  cd "$pkgname-$pkgver"
  go build -trimpath -buildmode=pie -mod=readonly
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 pcstat "${pkgdir}/usr/bin/pcstat"
}
