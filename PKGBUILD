# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=vue-cli
pkgver=3.0.0
pkgrel=1
pkgdesc='Standard tooling for Vue.js development'
arch=(any)
url=https://cli.vuejs.org
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(nodejs-vue-cli)
source=(https://github.com/vuejs/vue-cli/archive/v$pkgver.tar.gz)
sha512sums=('e3e5cdbf87e9141c531f4f486e8f65c99f3317f1966190aa8f54908235aec202c4f4eb90fc663883f02d8287da7874d5f20c04b91528845633ce169b64535738')

build() {
  cd vue-cli-$pkgver
  npm install
}

package() {
  cd vue-cli-$pkgver
  _dest="$pkgdir"/usr/lib/node_modules/vue-cli
  mkdir -p $_dest
  cp -a . $_dest
  install -Dm 644 -t "$pkgdir"/usr/share/licenses/vue-cli LICENSE
}
