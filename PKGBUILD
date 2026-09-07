# Maintainer: Sergey Voloshin <dl@varme.pw>

pkgname='dl-bin'
pkgver=1.3.0
pkgrel=1
pkgdesc='Deploy Local - site deployment assistant locally. A convenient wrapper over docker-compose, which simplifies the local deployment of the project.'
url='https://local-deploy.github.io'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('dl')
conflicts=('dl')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/local-deploy/dl/releases/download/${pkgver}/dl-${pkgver}-linux-arm64.tar.gz")
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/local-deploy/dl/releases/download/${pkgver}/dl-${pkgver}-linux-amd64.tar.gz")

sha256sums_aarch64=('55d930ecc29e273632e5628dfab7cc975fe335430608673448ffac77765e23fe')
sha256sums_x86_64=('a630ad25e6cde88c04b5232d7a2f997e27dcebc89dab92185190ac165f1b3426')

package() {
  # bin
  install -Dm755 "./dl" "${pkgdir}/usr/bin/dl"

  # config dir
  install -m 0755 -d "${pkgdir}/etc/dl/config-files"
}
