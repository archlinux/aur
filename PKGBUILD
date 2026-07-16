# Maintainer: Vincent Pochet <vincent dot pochet at gmail dot com>
#
# Check for new version at https://github.com/porter-dev/releases/releases

pkgname=porter-cli
pkgver=0.68.41
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
'c1e93edadec52be86d034773de040ecddbde4886f3ee566aaa190875a502fce6'
'008a3e947e9b312adb7b4824a090b0825d2ba78dceedf284690ae08616a9023f'
)
source_aarch64=(
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/porter_${pkgver}_linux_arm64"
  "https://github.com/porter-dev/releases/releases/download/v${pkgver}/docker-credential-porter_${pkgver}_linux_arm64"
)
sha256sums_aarch64=(
'828684ba909314cd9fcf2937832cfc72f372f524a679e89f25413dd76aac03f8'
'0fef59e39ee1bc1cca858f0b42b272470160157f9a2e3faca820fe17983cd381'
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
