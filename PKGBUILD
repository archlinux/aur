# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=nodejs-hexo-cli
_srcname=${pkgname#nodejs-}
pkgver=4.2.0
pkgrel=2
pkgdesc="Command line interface for Hexo"
arch=('any')
url="https://github.com/hexojs/hexo-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
conflicts=('nodejs-hexo')
source=(https://registry.npmjs.org/$_srcname/-/$_srcname-$pkgver.tgz)
noextract=($_srcname-$pkgver.tgz)
sha256sums=('f169b782712f88eb4ebfc7498a359a0535852c2166e7f58193b85caee8f992e9')

package() {
  npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/$_srcname-$pkgver.tgz

  chmod -R u=rwX,go=rX "$pkgdir"
  chown -R root:root "$pkgdir"

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s ../../../lib/node_modules/$_srcname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
