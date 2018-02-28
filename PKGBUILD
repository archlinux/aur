# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>

_npmname=markdown-pdf
pkgname=nodejs-$_npmname
pkgver=8.1.1
pkgrel=1
pkgdesc="Markdown to PDF converter"
arch=('any')
url="https://github.com/alanshaw/markdown-pdf"
license=('MIT')
depends=('nodejs' 'phantomjs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-${pkgver//_/-}.tgz)
noextract=($_npmname-${pkgver//_/-}.tgz)
sha1sums=('25c025d4f4f91869ac0f3f6fd7f7d32237669438')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@${pkgver//_/-}
}
