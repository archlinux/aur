# Maintainer: Vincent Pochet <vincent dot pochet at gmail dot com>
#
# Check for new version at https://github.com/porter-dev/releases/releases

pkgname=porter-cli
pkgver=0.57.7
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
'aefe804fe02d77413e84b6f37266b8c8299ca03867c469514c4a503417bffcbd'
'46bfd62744c9d3ab55904e51127f29d3b41beead280cb6a0c96d838ab98ac151'
)

package() {
  install -Dm755 "${srcdir}/porter_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/porter"
  install -Dm755 "${srcdir}/docker-credential-porter_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/docker-credential-porter"
}
