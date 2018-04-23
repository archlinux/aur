# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=vue-cli
pkgver=2.9.3
pkgrel=1
pkgdesc='A simple CLI for scaffolding Vue.js projects'
arch=(any)
url='https://github.com/vuejs/vue-cli'
license=(MIT)
depends=(nodejs)
makedepends=(npm)
conflicts=(nodejs-vue-cli)
options=(!emptydirs !strip)
source=(http://registry.npmjs.org/vue-cli/-/vue-cli-$pkgver.tgz)
noextract=(vue-cli-$pkgver.tgz)
sha512sums=(710abc3dd407acb805d8c3b3612cb580df3ac32ab691c7a35599766da33655c1979854a1ead7b4c28d4947fe1eb5b781c3d800c4cfd6caec3cec55d6286b4979)

package() {
  cd $srcdir
  local _npmdir=$pkgdir/usr/lib/node_modules
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix $pkgdir/usr vue-cli@$pkgver
}
