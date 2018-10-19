# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=vue-cli
pkgver=3.0.5
pkgrel=1
pkgdesc='Standard tooling for Vue.js development'
arch=(i686 x86_64)
url=https://cli.vuejs.org
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(nodejs-vue-cli)
options=(!strip)
source=(https://github.com/vuejs/vue-cli/archive/v$pkgver.tar.gz)
sha512sums=('a9d6510a6df8251b7bfc5af80c1e2c2526ffc46506f07516048c09f9d45cadfcb932c17b317c5a2a312e1f75b39a7c4353f7adee2350b556997375e6123277b7')

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
