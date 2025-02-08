# Maintainer: Sergey Voloshin <dl@varme.pw>

pkgname='dl-bin'
pkgver=1.1.3
pkgrel=1
pkgdesc='Deploy Local - site deployment assistant locally. A convenient wrapper over docker-compose, which simplifies the local deployment of the project.'
url='https://local-deploy.github.io'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('dl')
conflicts=('dl')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/local-deploy/dl/releases/download/${pkgver}/dl-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/local-deploy/dl/releases/download/${pkgver}/dl-${pkgver}-linux-amd64.tar.gz")

sha256sums_aarch64=('370b415964a02245904067bb32149503934bf2b22c2b2adb22809f3be5fb8f56')
sha256sums_x86_64=('046072ca1a57d27a64298f5ba56d72aed2ac9e7ec49be49398f67e242c39d5ae')

package() {
  # bin
  install -Dm755 "./dl" "${pkgdir}/usr/bin/dl"

  # config dir
  install -m 0755 -d "${pkgdir}/etc/dl/config-files"
}
