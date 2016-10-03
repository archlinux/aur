# Maintainer: Daniel Maslowski <info@orangecms.org>

_gitname=chimp
_gitver=0.41.1
pkgname=nodejs-${_gitname}
pkgver=$_gitver
pkgrel=1
pkgdesc="Develop acceptance tests & end-to-end tests with realtime feedback"
arch=(any)
url="http://chimp.readme.io"
license=('MIT')
depends=('nodejs' 'phantomjs')
source=("https://github.com/xolvio/$_gitname/archive/v$pkgver.tar.gz")
sha256sums=('48ba2457b333b41726b1251c11d96b8879dfef21e38e836d3f5711b503694c98')

prepare() {
  cd "$srcdir/$_gitname-$_gitver"
  /usr/bin/npm i
}

package() {
  cd "$srcdir/$_gitname-$_gitver"
  /usr/bin/npm i -g --unsafe-perm --prefix "$pkgdir/usr"
  cp -a dist "$pkgdir/usr/lib/node_modules/$_gitname/"
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname}/README"
}
