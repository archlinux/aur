# Maintainer: Pouyan Heyratpour <pouyan@janstun.com>

pkgname=polywatch
pkgver=1.0.1
pkgrel=1
pkgdesc="File change watcher with filter & rate limit feature which run command(s) when file change events happen"
arch=('any')
url="https://pouyanh.github.io/polywatch/"
license=('GPL3')
depends=()
makedepends=('go')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pouyanh/polywatch/archive/v${pkgver}.tar.gz)
md5sums=('90bc6e427ff6f1914163de1024123290')

build() {
  cd "${pkgname}-${pkgver}"

  go mod tidy
  go build ./cmd/polywatch
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 polywatch -t "${pkgdir}/usr/bin"
}