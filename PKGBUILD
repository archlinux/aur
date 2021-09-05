# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=gosecretsdump
pkgver=0.3.1
pkgrel=2
pkgdesc="Go Prog to dump windows passwords from ntds.dit and SAM/system files"
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/C-Sto/gosecretsdump"
license=('GPL3')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/C-Sto/gosecretsdump/archive/v${pkgver}.tar.gz")
sha256sums=('7e695e664d95eda72d1442ef3355869f7e5d3ec9e6b2b63affd16b118178173e')

build() {
  cd "${pkgname}-${pkgver}"
  GOPATH="$srcdir/gopath" go build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 gosecretsdump "${pkgdir}/usr/bin/gosecretsdump"
}
