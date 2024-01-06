# Maintainer: VVL <me@ivvl.ru>

pkgname=shlink-web-client
pkgver=3.10.2
pkgrel=1
pkgdesc="A ReactJS-based progressive web application for Shlink"
arch=('any')
url="https://github.com/shlinkio/shlink-web-client"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('MIT')
source=("https://github.com/shlinkio/shlink-web-client/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('fab7447a2e23324cb12f0e14cf84595fc386ffe4f85cb826295b7dd6ac575999bd1bf746cc3d5e9d713cb59eea4586062cbf6de562cea524e86fb536941b4ab9')

build() {
  cd "$pkgname-$pkgver"
  npm install
  npm run build
}

package() {
  install -d "${pkgdir}/usr/share/webapps/shlink-web-client/"
  cp -r ${srcdir}/$pkgname-$pkgver/build/* ${pkgdir}/usr/share/webapps/shlink-web-client/
}
