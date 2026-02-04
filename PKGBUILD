# Maintainer: Choi Madeleine <gankiann.niu@gmail.com>
pkgname=mwcli
pkgver=v0.30.0
pkgrel=1
pkgdesc="MediaWiki focused command line tool targeting developers"
arch=('x86_64')
url="https://gitlab.wikimedia.org/repos/releng/cli"
license=('GPL')
_platform=$(uname | tr '[:upper:]' '[:lower:]')
_filename=mw_${pkgver}_${_platform}_amd64
source=("https://gitlab.wikimedia.org/api/v4/projects/16/packages/generic/mwcli/${pkgver}/${_filename}")
sha256sums=('73f62301b9ce2a45c4d3ae268dd9a2cd2a98a83595d26bd70ce0116c8a001714')

package() {
  cd "$srcdir"
  mv "$_filename" "mw"
  install -Dm0755 -t "$pkgdir/usr/bin/" "mw"
}
