# Maintainer: Choi Madeleine <gankiann.niu@gmail.com>
pkgname=mwcli
pkgver=v0.28.0
pkgrel=1
pkgdesc="MediaWiki focused command line tool targeting developers"
arch=('x86_64')
url="https://gitlab.wikimedia.org/repos/releng/cli"
license=('GPL')
_platform=$(uname | tr '[:upper:]' '[:lower:]')
_filename=mw_${pkgver}_${_platform}_amd64
source=("https://gitlab.wikimedia.org/api/v4/projects/16/packages/generic/mwcli/${pkgver}/${_filename}")
sha256sums=('c91082e1741d4f48cf67b2d0a54aed9ac63f70044153203eeab3e5bf63ba1cea')

package() {
  cd "$srcdir"
  mv "$_filename" "mw"
  install -Dm0755 -t "$pkgdir/usr/bin/" "mw"
}
