# Maintainer: Vincent Pochet <vincent dot pochet at gmail dot com>
#
# Check for new version at https://github.com/porter-dev/releases/releases

pkgname=porter-cli
pkgver=0.65.4
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
'a205d59adc7171c688b6a7f6b165545b8a4ea9b879cc4837d71e110cbfebf14c'
'8a1c70fe19aa0c548be414a5def12655941d79416cd26bea9b27bbd2fb146bbf'
)


package() {
  install -Dm755 "${srcdir}/porter_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/porter"
  install -Dm755 "${srcdir}/docker-credential-porter_${pkgver}_linux_amd64" "${pkgdir}/usr/bin/docker-credential-porter"
}
