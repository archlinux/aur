# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=darkman
pkgver=0.4.0
pkgrel=1
pkgdesc="Framework for dark-mode and light-mode transitions on Linux desktop."
arch=('any')
url="https://gitlab.com/whynothugo/darkman"
license=('ISC')
depends=('geoclue')
makedepends=('go')
source=("https://gitlab.com/WhyNotHugo/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha512sums=('9b0890b0e56cdc71c6aadd6c0e4c67948932b3f629bafbb4339bb8fed090b6a764e13de4e0ed34675d68f6a30003a2b7fe222d2e1b93c03178a4a659e1a79a9f')

build() {
  cd "$pkgname-v$pkgver"
  make build
}

package() {
  cd "$pkgname-v$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr/ install
  # TODO: manpages
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
}
