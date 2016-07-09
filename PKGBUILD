# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>

pkgname=github-release
pkgver=0.6.2
pkgrel=1
pkgdesc="Command-line app to create and edit releases on GitHub (and upload artifacts)"
arch=('i686' 'x86_64')
url="https://github.com/aktau/github-release"
makedepends=('go')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=("SKIP")

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -dm755 "${pkgdir}/usr/bin"
  install -dm644 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -Dm755 github-release \
    "${pkgdir}/usr/bin/github-release"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
