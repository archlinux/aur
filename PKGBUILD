# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=darkman
pkgver=0.3.0
pkgrel=1
pkgdesc="Framework for dark-mode and light-mode transitions on Linux desktop."
arch=('any')
url="https://gitlab.com/whynothugo/darkman"
license=('ISC')
depends=('geoclue')
makedepends=('go')
source=("https://gitlab.com/WhyNotHugo/darkman/-/archive/v${pkgver}/darkman-v${pkgver}.tar.gz")
sha256sums=('b56a4037574cd8979bb1f16ea0115612de0a022a0a4bdb144aa155b84bbaf92d')

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
