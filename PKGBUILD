# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

_npmname=intelephense
pkgname=nodejs-$_npmname
pkgver=1.12.3
pkgrel=1
pkgdesc="Intelephense is a PHP language server adhering to the Language Server Protocol."
arch=('any')
url="https://github.com/bmewburn/vscode-intelephense"
license=('MIT')
depends=(nodejs)
makedepends=(npm)
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
sha256sums=('089c848282b72c99b1ceb87ee6721634b6b643a3717a5537f265d82724782d9d')
noextract=($_npmname-$pkgver.tgz)

package() {
  npm install \
    --user=root --global \
    --prefix "$pkgdir/usr" \
    "$srcdir"/$_npmname-$pkgver.tgz

  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +
  chown -R root:root "$pkgdir"
}
