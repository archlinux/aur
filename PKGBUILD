# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=vot-cli-live
pkgver=1.7.2
pkgrel=1    
pkgdesc="VOT-CLI with Yandex live voices support"
arch=(any)
url="https://github.com/fantomcheg/$pkgname"
license=(Unlicense)
depends=(
  bun
  nodejs
  sh
)
makedepends=(npm)

provides=(${pkgname%-live})
conflicts=(${pkgname%-live})
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('3de8194c5ee43dc40c35bcc3e17fa7a94d6d8ea411c6ec94fa3dd23477308d063833e1a3536ef984daa2cb7528c70cf9f2d7139f0961941aa0249a8fb2a0649e')

package() {
  install -vd "$pkgdir"/usr/lib/node_modules/
  cd "$pkgdir"/usr/lib/node_modules/
  npm install -g --prefix "$pkgdir"/usr $pkgname@$_npmver
  chown -R root:root "$pkgdir"/usr
}
