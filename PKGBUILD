# Maintainer: Jean Lucas <jean@4ray.co>

_npmname=weex-toolkit
pkgname=nodejs-$_npmname
pkgver=1.2.9
pkgrel=1
pkgdesc='Apache Weex CLI toolkit'
arch=(any)
url='https://github.com/weexteam/weex-toolkit'
license=(GPL3)
depends=(nodejs)
makedepends=(npm)
options=(!emptydirs !strip)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha512sums=(490fd9c77fdf7058f2634ad2974c2c52ff09a42991f66393f69c84d7cc7385907ce443d6c4591f4d74be7d1b53444c2364353e9da9a745788b03768c8a9ce87e)

package() {
  cd $srcdir
  local _npmdir=$pkgdir/usr/lib/node_modules
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix $pkgdir/usr $_npmname@$pkgver
}
