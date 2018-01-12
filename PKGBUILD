# Maintainer: Doron Behar <doron.behar@gmail.com>

pkgname=2fa
pkgver=1.1.0
pkgrel=1
pkgdesc="Two factor authentication agent"
arch=('x86_64')
license=('BSD')
depends=('glibc')
makedepends=('go')
conflicts=('2fa-git')
replaces=('2fa-git')
source=("https://github.com/rsc/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ecd5ba067d3e3bbc3f8c10fa2df01b1b388b1cd6503fb56381573d8d17497755')

build() {
  cd "$pkgname-$pkgver"
  GOPATH=`pwd` go get -d -v
}

check() {
  cd "$pkgname-$pkgver"
  GOPATH=`pwd` go build
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ${pkgname}-${pkgver} "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
