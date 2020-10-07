# Maintainer: Pedro Lucas Porcellis <porcellis@eletrotupi.com>
_npmname=percollate
pkgname=nodejs-percollate
pkgver=1.1.0
pkgrel=1
pkgdesc="Percollate is a command-line tool that turns web pages into beautifully formatted PDF, EPUB, or HTML files."
arch=(any)
url="https://github.com/danburzo/percollate/"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('19906e459086ba2d7616630cbb6123d74210ce2228cc8364c47a60b4f4665bef')
options=(!strip)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  find "$pkgdir"/usr -type d -exec chmod 755 {} +
  install -Dm755 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
