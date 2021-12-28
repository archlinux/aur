# Maintainer: Pierre Lalet <pl@ivre.rocks>

pkgname=masscanned
pkgver=0.2.0
pkgrel=1
pkgdesc='A low-interaction focused on network scanners and bots. It integrates very well with IVRE to build a self-hosted alternative to GreyNoise.'
arch=('any')
url='https://ivre.rocks/'
license=('GPL3')
makedepends=('rust')
source=("https://github.com/ivre/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a7d3fcc1fd7ef5df16eea30db0309c3b8c21deb20feae0ef4386c79b4f11bd560ec0d8a37b2fc195743a220b6d7d65b251efcaf04fb6e5e8a6e9c90b6347a7f3')

build() {
  (
    cd "$srcdir/$pkgbase-$pkgver"
    cargo build --release
  )
}

package() {
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dvm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
