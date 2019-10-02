# Maintainer: Andrea 'alephZer0' Gómez <crypto.andrea at protonmail dot ch> -> https://github.com/da-edra

pkgname=gitrob
pkgver=2.0.0_beta
pkgrel=1
pkgdesc="Reconnaissance tool for GitHub organizations."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/michenriksen/gitrob"
license=('MIT')
depends=()
makedepends=('go-pie')
provides=("gitrob")
conflicts=("gitrob")
source=("${pkgname}-${pkgver//_/-}.tar.gz::${url}/archive/v${pkgver//_/-}.tar.gz")
md5sums=('a86798791ad02849c28d1003d94f01ef')
sha256sums=('a76cad52bbc15299cc4c2801716e62f2cf84ee840a4a23b6f973b20bc9395532')

prepare() {
  export GO111MODULE=on
}

build() {
  cd "${pkgname}-${pkgver//_/-}"
  go build
}

package() {
  cd "${pkgname}-${pkgver//_/-}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dsm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
