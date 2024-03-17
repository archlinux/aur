# Maintainer: VVL <me@ivvl.ru>

pkgname=shlink-web-client
pkgver=4.1.0
pkgrel=1
pkgdesc="A ReactJS-based progressive web application for Shlink"
arch=('any')
url="https://github.com/shlinkio/shlink-web-client"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('MIT')
source=("https://github.com/shlinkio/shlink-web-client/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('b1872d79e3f84c9bbe65af96d3209afb7285d5e3d27dfbfc429c10ea34b3f26f93654c08aaf2191f6c545a19863fe469b618750d2315137fd3ab378cf8bf299a')

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
