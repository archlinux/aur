# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

_npmname=intelephense
pkgname=nodejs-$_npmname
pkgver=1.3.5
pkgrel=1
pkgdesc="Intelephense is a PHP language server adhering to the Language Server Protocol."
arch=('any')
url="https://github.com/bmewburn/vscode-intelephense"
license=('MIT')
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('d9bcd6a4582eecd52024cf372beeb2c6fa7a834eff284efd37b29009186512d0')
noextract=($_npmname-$pkgver.tgz)

package() {
  npm install \
    --user root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
  chown -R root:root "$pkgdir"
}
