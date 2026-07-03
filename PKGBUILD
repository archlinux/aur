# Maintainer: Choi Madeleine <gankiann.niu@gmail.com>
pkgname=mwcli
pkgver=v0.31.0
pkgrel=1
pkgdesc="MediaWiki focused command line tool targeting developers"
arch=('x86_64')
url="https://gitlab.wikimedia.org/repos/releng/cli"
license=('GPL')
_platform=$(uname | tr '[:upper:]' '[:lower:]')
_filename=mw_${pkgver}_${_platform}_amd64
source=("https://gitlab.wikimedia.org/api/v4/projects/16/packages/generic/mwcli/${pkgver}/${_filename}")
sha256sums=('b938da6e81aa623c539e8298d939039292ae995181343cf8457680eabcd9a6db')

package() {
  cd "$srcdir"
  mv "$_filename" "mw"
  install -Dm0755 -t "$pkgdir/usr/bin/" "mw"
}
