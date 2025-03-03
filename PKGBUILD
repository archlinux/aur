# Maintainer: Vincent Pochet <vincent dot pochet at gmail dot com>
#
# Check for new version at https://github.com/porter-dev/releases/releases

pkgname=porter-cli
pkgver=0.57.10
pkgrel=1
pkgdesc="CLI for Porter.dev, a Kubernetes powered PaaS that runs in your own cloud."
arch=('x86_64')
url="https://www.porter.run/"
license=('custom:porter')
source=(
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/porter_${pkgver}_linux_amd64"
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/docker-credential-porter_${pkgver}_linux_amd64"
)
sha256sums=(
'938432d67b946be8f868ae69e9ac8d60e35fe0f4a2125c88f8341b8811abdb2b'
'1e29815af95f19f3bad2fe2862f5ce2c5d8d09952d2d5396fb51b08351cc3724'
)

package() {
  install -Dm755 "${srcdir}/porter_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/porter"
  install -Dm755 "${srcdir}/docker-credential-porter_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/docker-credential-porter"
}
