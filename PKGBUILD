# Maintainer: Vincent Pochet <vincent dot pochet at gmail dot com>
#
# Check for new version at https://github.com/porter-dev/releases/releases

pkgname=porter-cli
pkgver=0.68.4
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
'68db5935717125daad1579c810ac1bd1b0f5e1b26bad4df6fa1a3e993249ff5d'
'4be102cd76476b92e2ee144f404ef185d22b61a35df442fbdb5ba37c11dc29c1'
)


package() {
  install -Dm755 "${srcdir}/porter_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/porter"
  install -Dm755 "${srcdir}/docker-credential-porter_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/docker-credential-porter"
}
