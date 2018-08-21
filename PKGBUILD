# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=vue-cli
pkgver=3.0.1
pkgrel=2
pkgdesc='Standard tooling for Vue.js development'
arch=(i686 x86_64)
url=https://cli.vuejs.org
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(nodejs-vue-cli)
options=(!strip)
source=(https://github.com/vuejs/vue-cli/archive/v$pkgver.tar.gz)
sha512sums=('a547fd18933cb94f76df12280ba95260089964d4bbf2274247902f01a24951cd9b5cd0d473a315dbc7be8a55725d82182dc31032e0fce593b8f485493eeaf01e')

build() {
  cd vue-cli-$pkgver
  npm install
}

package() {
  cd vue-cli-$pkgver
  _dest=/usr/lib/node_modules/vue-cli
  mkdir -p "$pkgdir"/{$_dest,/usr/bin}
  cp -a . "$pkgdir"/$_dest
  ln -s $_dest/packages/@vue/cli/bin/vue.js "$pkgdir"/usr/bin/vue
  install -Dm 644 -t "$pkgdir"/usr/share/licenses/vue-cli LICENSE
}
