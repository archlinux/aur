# Maintainer: Sergey Voloshin <dl@varme.pw>

pkgname='dl-bin'
pkgver=1.1.0
pkgrel=1
pkgdesc='Deploy Local - site deployment assistant locally. A convenient wrapper over docker-compose, which simplifies the local deployment of the project.'
url='https://local-deploy.github.io'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('dl')
conflicts=('dl')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/local-deploy/dl/releases/download/${pkgver}/dl-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/local-deploy/dl/releases/download/${pkgver}/dl-${pkgver}-linux-amd64.tar.gz")

sha256sums_aarch64=('2283737dbf8750600c2f3adb8869f2822fc50e846b9641a235e8f95cea5d742d')
sha256sums_x86_64=('c552d15963f44911b91e062b74288648cbba094003be92dbfbb09825519724c5')

package() {
  # bin
  install -Dm755 "./dl" "${pkgdir}/usr/bin/dl"

  # config dir
  install -m 0755 -d "${pkgdir}/etc/dl/config-files"
}
