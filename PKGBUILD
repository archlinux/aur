# Maintainer: Jonas Amundsen <jonasba+aur at gmail dot com>

_npmname=markdown-pdf
pkgname=nodejs-$_npmname
pkgver=5.3.0
pkgrel=1
pkgdesc="Markdown to PDF converter"
arch=('any')
url="https://github.com/alanshaw/markdown-pdf"
license=('MIT')
depends=('nodejs' 'phantomjs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-${pkgver//_/-}.tgz)
noextract=($_npmname-${pkgver//_/-}.tgz)
sha1sums=('3b1d11ae930f57100abd767dd51c09503d940686')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@${pkgver//_/-}
}
