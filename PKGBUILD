# Maintainer: VVL <me@ivvl.ru>

pkgname=shlink-web-client
pkgver=4.0.0
pkgrel=1
pkgdesc="A ReactJS-based progressive web application for Shlink"
arch=('any')
url="https://github.com/shlinkio/shlink-web-client"
optdepends=('nginx: reverse-proxy')
makedepends=('nodejs' 'npm')
license=('MIT')
source=("https://github.com/shlinkio/shlink-web-client/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f438a6bfb12cb323245793497f98cb0beb28dba8c9b0fd51037de5783373841b4706d01a99fc385cb74f3dfd8bf14a6373ef163639584a2c5ff37bb8c0b8431c')

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
