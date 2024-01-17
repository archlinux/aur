# Maintainer: Sergey Voloshin <dl@varme.pw>

pkgname='dl-bin'
pkgver=1.0.7
pkgrel=1
pkgdesc='Deploy Local - site deployment assistant locally. A convenient wrapper over docker-compose, which simplifies the local deployment of the project.'
url='https://local-deploy.github.io'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('dl')
conflicts=('dl')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/local-deploy/dl/releases/download/${pkgver}/dl-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/local-deploy/dl/releases/download/${pkgver}/dl-${pkgver}-linux-amd64.tar.gz")

sha256sums_aarch64=('e39c573efb40ab7cb0301b434080f36c962057b2de47648b53de7901e35f5775')
sha256sums_x86_64=('6c84ca1413b7eef8434688fdbee3baa0207c2f629d938c9c05fc1f3b26b853c5')

package() {
  # bin
  install -Dm755 "./dl" "${pkgdir}/usr/bin/dl"

  # config dir
  install -m 0755 -d "${pkgdir}/etc/dl/config-files"
}
