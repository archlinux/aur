# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=weex-toolkit
pkgver=2.0.0beta.31
_pkgver=${pkgver/beta/-beta}
pkgrel=2
pkgdesc='Official CLI for Apache Weex development'
arch=(any)
url=https://github.com/weexteam/weex-toolkit
license=(MIT)
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$_pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha512sums=('f42d0fa5d58105dde338fa9d682bf3d88882fc8e2dc602328842cb303b05fddbbaae886579b951b5903853f0f97b7a98c3c65461756a1ffd4965a26d73e83acc')

package() {
  npm i -g --prefix "$pkgdir"/usr $pkgname-$_pkgver.tgz

  cd "$pkgdir"/usr
  install -Dm 644 lib/node_modules/$pkgname/LICENSE -t share/licenses/$pkgname
}
