# Maintainer: icasdri <icasdri at gmail dot com>

_npmname=html-pdf
pkgname=nodejs-$_npmname
pkgver=2.1.0
pkgrel=1
pkgdesc="HTML to PDF converter"
arch=('any')
url="https://github.com/marcbachmann/node-html-pdf"
license=('MIT')
depends=('nodejs' 'phantomjs')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-${pkgver//_/-}.tgz")
noextract=("$_npmname-${pkgver//_/-}.tgz")
sha384sums=('d499a573852a39935527625ff2bf1c555eaeb037d84a45673e91137dcc7d7d56740536fba77ccada37cddb90869bb129')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" "$_npmname@${pkgver//_/-}"
}
