# Maintainer: Vincent Pochet <vincent dot pochet at gmail dot com>
#
# Check for new version at https://github.com/porter-dev/releases/releases

pkgname=porter-cli
pkgver=0.68.37
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
'ffdda918693489bf5d236b27dd59f5d8c5f153077fff15365adbd536a922e51f'
'c3291f3772a5400c21963cd9c9595521a7255ee917ab2c605356a1b673996081'
)
source_aarch64=(
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/porter_${pkgver}_linux_arm64"
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/docker-credential-porter_${pkgver}_linux_arm64"
)
sha256sums_aarch64=(
'aa24835f26764ea71fb57ab3b996d8d12b0ea6ed2242ccc939c74f08c5bd0490'
'd9e897c44f3f381272bb96f22325b2a70a6a6476015adb4a7845aaa0fa4b426a'
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
