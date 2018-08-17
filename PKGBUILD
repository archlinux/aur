# Maintainer: David Vogt <d@408.ch>

pkgname=git-bug
pkgver=0.2.0
pkgrel=2
pkgdesc="Distributed bug tracker embedded in Git"
arch=('x86_64' 'i686')
url="https://github.com/MichaelMure/git-bug"
license=('GPLv3')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/MichaelMure/$pkgname/archive/$pkgver.tar.gz")
#https://github.com/MichaelMure/git-bug/archive/0.2.0.tar.gz
sha256sums=('56b05fb8c456973871863138ac5eb2a871654e7a504605970cbe9a08b6ce0b19')

build() {
  cd "$pkgname-$pkgver"
  go build -o "$pkgname"
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 git-bug "$pkgdir/usr/bin/git-bug"
}

# vim:set ts=2 sw=2 et:
