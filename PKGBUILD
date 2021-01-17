# Maintainer: Your Name <youremail@domain.com>

pkgname=gosecretsdump
pkgver=0.3.0
pkgrel=1
pkgdesc="Go Prog to dump windows passwords from ntds.dit and SAM/system files"
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/C-Sto/gosecretsdump"
license=('unknown')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/C-Sto/gosecretsdump/archive/v${pkgver}.tar.gz")
sha256sums=('d0b4ff67d9b8e53b2fa40535ed26dca9e6de255bcc11ae37e0b3f761b63dfb6d')

build() {
  cd "${pkgname}-${pkgver}"
  GOPATH="$srcdir/gopath" go build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 gosecretsdump "${pkgdir}/usr/bin/gosecretsdump"
}
