# Maintainer: Michel Boucey <michel dot boucey at gmail dot com>
pkgname=dumber
pkgdesc='(un)numbering Mardown sections and add/remove tables of content'
license=('BSD-3-Clause')
pkgver=3.0.0.3
pkgrel=2
arch=('x86_64')
url="https://github.com/MichelBoucey/$pkgname"
makedepends=('git'
             'go')
source=("git+https://github.com/MichelBoucey/$pkgname#tag=v$pkgver")
sha256sums=('41e498408ee45fa09d53a5f3aab7e5f4beb24d47749465a296335f6ef361bab6')

build() {
  cd "$pkgname"
  make build
}

check() {
  cd "$pkgname"
  make test
}

package() {
  cd "$pkgname"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 $pkgname "${pkgdir}/usr/local/bin/${pkgname}"
}
