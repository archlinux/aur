# Maintainer: Vincent Pochet <vincent dot pochet at gmail dot com>
#
# Check for new version at https://github.com/porter-dev/releases/releases

pkgname=porter-cli
pkgver=0.68.36
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
'71d29f4ad65fc8c02897fe06b834edf0d2fdf5c922b6cc5bcf664333cb40173f'
'61bdf90d4d39247049328f4c17a6b80ed18875786aed30871a7ef0bc014bd98b'
)
source_aarch64=(
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/porter_${pkgver}_linux_arm64"
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/docker-credential-porter_${pkgver}_linux_arm64"
)
sha256sums_aarch64=(
'3eff9d7102f01af19ea580107cb8d23c0d5ee48356c244b110e03ccfbc4f2e34'
'1e173c57be91ce59a4003b5f337a401991545af07efe8e7e28824081d34a3caa'
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
