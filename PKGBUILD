# Maintainer: robertfoster
pkgname=local-ai
_pkgname=LocalAI
pkgver=1.40.0
pkgrel=1
pkgdesc="Free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first."
arch=('aarch64' 'x86_64')
url="https://github.com/mudler/LocalAI"
license=('MIT')
depends=('glibc')
makedepends=('c-ares' 'git' 'go' 'grpc' 'make' 'openssl' 're2')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${_pkgname}-${pkgver}"
  make build
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm775 "${pkgname}" -t "${pkgdir}/usr/bin/"
}

sha256sums=('1f55271a038caa00031f220e570eedc25ec1d232686b30c72465746058a05e79')
