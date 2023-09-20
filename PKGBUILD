# Maintainer: Marcel Campello <marcel@prafrentex.com.br>
pkgname=opentofu
pkgver=1.6.0_dev
pkgrel=1
pkgdesc="The open source infrastructure as code tool."
arch=('any')
url="https://opentofu.org"
license=('MPL2')
makedepends=(
  'git'
  'go>=1.20.7'
)
source=("${pkgname}.zip::https://github.com/opentofu/opentofu/archive/refs/heads/main.zip")
sha256sums=('SKIP')

build() {
  export GOPATH="${srcdir}/go"
  export CGO_ENABLED=0

  cd "${srcdir}/${pkgname}-main"
  pwd
  go install
}

package() {
  cd "${srcdir}/go"
  install bin/opentofu -t "${pkgdir}/usr/bin" -Dm 0755
}
