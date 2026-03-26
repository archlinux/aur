# Maintainer: Vincent Pochet <vincent dot pochet at gmail dot com>
#
# Check for new version at https://github.com/porter-dev/releases/releases

pkgname=porter-cli
pkgver=0.68.10
pkgrel=3
pkgdesc="CLI for Porter.dev, a Kubernetes powered PaaS that runs in your own cloud."
arch=('x86_64' 'aarch64')
url="https://www.porter.run/"
license=('custom:porter')
source_x86_64=(
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/porter_${pkgver}_linux_amd64"
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/docker-credential-porter_${pkgver}_linux_amd64"
)
sha256sums_x86_64=(
'57057927e7a6441bdc60ad43c7c8206cf861257d9bfcdcf630794c1a2404e735'
'079921050ec72c53722b2cec01b1592cec143bab45616f83c395ff3a36107b62'
)
source_aarch64=(
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/porter_${pkgver}_linux_arm64"
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/docker-credential-porter_${pkgver}_linux_arm64"
)
sha256sums_aarch64=(
'6a61cd2a87396824b389f95467916843a19aadd9c12bf71d21f73322e169f7b9'
'e9aa757cc70b590fc2af6edd1530d12fc8221794da38c5464a12903a92539241'
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
