# Maintainer: Luca Weiss <WEI16416@spengergasse.at>

pkgname=azure-vhd-utils-for-go-git
_pkgname=azure-vhd-utils-for-go
pkgver=2016.04.10
pkgrel=1
pkgdesc="Azure VHD utilities for Go."
arch=('x86_64' 'i686')
url="https://github.com/Microsoft/azure-vhd-utils-for-go"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
_gourl=github.com/Microsoft/azure-vhd-utils-for-go

build() {
  export GOPATH="$srcdir/build"
  go get -fix -v -x ${_gourl}
}

package() {
  install -Dm755 $srcdir/build/bin/azure-vhd-utils-for-go "$pkgdir/usr/bin/vhd"
  install -Dm644 $srcdir/build/src/${_gourl}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
