# Maintainer: Joel Noyce Barnham <joelnbarnham@gmail.com>
# Contributor: xeptore <hello [ at ] xeptore [ dot ] dev>

pkgname=docker-credential-pass-bin
pkgver=0.9.8
pkgrel=2
pkgdesc='Store docker credentials using the Standard Unix Password Manager (pass)'
arch=('x86_64')
url='https://github.com/docker/docker-credential-helpers'
license=('MIT')
depends=('pass')
makedepends=()
provides=("docker-credential-pass")
conflicts=("docker-credential-pass")
source_x86_64=(
  "docker-credential-pass-v${pkgver}.linux-amd64::https://github.com/docker/docker-credential-helpers/releases/download/v0.9.8/docker-credential-pass-v0.9.8.linux-amd64"
  'LICENSE::https://raw.githubusercontent.com/docker/docker-credential-helpers/v0.9.8/LICENSE'
)
sha256sums_x86_64=(
  '3ae93407d42dc90bd0393b0a50da3ce95246d3f30c3255225cb6b0401cd74cac'
  'a6c2a5fdf40879f644bdb0da9042f245e7e263237d623264aafcf2470610ad8c'
)

package() {
  install -D -m 0755 "${srcdir}/docker-credential-pass-v${pkgver}.linux-amd64" "${pkgdir}/usr/bin/docker-credential-pass"
  install -D -m 0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
