# Maintainer: Andrea 'alephZer0' Gómez <crypto.andrea at protonmail dot ch> -> https://github.com/da-edra

pkgname=shhgit
pkgver=0.2
pkgrel=1
pkgdesc="Find GitHub secrets in real time."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/eth0izzle/shhgit"
license=('MIT')
depends=()
makedepends=('go-pie')
provides=("shhgit")
conflicts=("shhgit")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0cce46f6474f1885b3bce057b8370017248cf3d7a4e16ddb91a6d2c626163680')

prepare() {
  export GO111MODULE=on
}

build() {
  cd "${pkgname}-${pkgver}"
  go build
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dsm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
