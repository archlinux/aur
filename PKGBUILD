# Maintainer: Vincent Pochet <vincent dot pochet at gmail dot com>
#
# Check for new version at https://github.com/porter-dev/releases/releases

pkgname=porter-cli
pkgver=0.68.24
pkgrel=1
pkgdesc="CLI for Porter.dev, a Kubernetes powered PaaS that runs in your own cloud."
arch=('x86_64' 'aarch64')
url="https://www.porter.run/"
license=('custom:porter')
source_x86_64=(
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/porter_${pkgver}_linux_amd64"
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/docker-credential-porter_${pkgver}_linux_amd64"
)
sha256sums_x86_64=(
'9867a509c31ac033d6da2f8b3e3e24fe85f438b6160ea832e8c0b2511d30dc84'
'5e7b703b28eae17c2188ed288576863a0696702da48c24ede3899c14d84d2c56'
)
source_aarch64=(
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/porter_${pkgver}_linux_arm64"
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/docker-credential-porter_${pkgver}_linux_arm64"
)
sha256sums_aarch64=(
'262a4de1b9d8bd915266b05b6274a438fadc32eb3ab6c40671c4948cadd15683'
'80251974d24b696d2a7f27126a4a8c49408870f32912537d74584a2aa68d5f06'
)


package() {
  if [[ "$CARCH" == "aarch64" ]]; then
    _arch=arm64
  else
    _arch=amd64
  fi

  install -Dm755 "${srcdir}/porter_${pkgver}_linux_${_arch}" "${pkgdir}/usr/bin/porter"
  install -Dm755 "${srcdir}/docker-credential-porter_${pkgver}_linux_${_arch}" "${pkgdir}/usr/bin/docker-credential-porter"
}
