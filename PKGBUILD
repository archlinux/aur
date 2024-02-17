# Maintainer: VVL <me@ivvl.ru>

pkgname=shlink-web-client
pkgver=4.0.1
pkgrel=1
pkgdesc="A ReactJS-based progressive web application for Shlink"
arch=('any')
url="https://github.com/shlinkio/shlink-web-client"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('MIT')
source=("https://github.com/shlinkio/shlink-web-client/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('effd4c263d1d15e5fbb8ec4031c45f16cec7528ef7a779cc684f404be6c83850867a71c1be20787d497bb5e9b5e84b45a4ee842e214a41f51e3f79407a7126a8')

build() {
  cd "$pkgname-$pkgver"
#  if you need to change homepage location:
#  sed -i 's,"homepage": "","homepage": "/shlink",g' package.json
  npm install
  npm run build
}

package() {
  install -d "${pkgdir}/usr/share/webapps/shlink-web-client/"
  cp -r ${srcdir}/$pkgname-$pkgver/build/* ${pkgdir}/usr/share/webapps/shlink-web-client/
}
