# Maintainer: Sergey Voloshin <dl@varme.pw>

pkgname='dl-bin'
pkgver=1.2.0
pkgrel=1
pkgdesc='Deploy Local - site deployment assistant locally. A convenient wrapper over docker-compose, which simplifies the local deployment of the project.'
url='https://local-deploy.github.io'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('dl')
conflicts=('dl')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/local-deploy/dl/releases/download/${pkgver}/dl-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/local-deploy/dl/releases/download/${pkgver}/dl-${pkgver}-linux-amd64.tar.gz")

sha256sums_aarch64=('0bde34fd46429ec31a136f11cc0f1da5331a48c689ac5f279b5ba543674407da')
sha256sums_x86_64=('b368437ffaa6de121007b9da992392bb12b16fabe561dfb6ecd34e7b22444c62')

package() {
  # bin
  install -Dm755 "./dl" "${pkgdir}/usr/bin/dl"

  # config dir
  install -m 0755 -d "${pkgdir}/etc/dl/config-files"
}
