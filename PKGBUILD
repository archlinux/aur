# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=xhtml-1-docs
_version=20101123
pkgver=1.1.${_version}
pkgrel=2
pkgdesc="XHTML 1.1 Documentation"
arch=('any')
url="http://www.w3.org/TR/xhtml11"
license=('W3C')
depends=("xhtml-modularization-1-docs")
options=('docs' '!strip')
source=("http://www.w3.org/TR/2010/REC-xhtml11-${_version}/xhtml11.tgz")
md5sums=('56366fb9ff58b79a2de71f127b9baf76')
replaces=('xhtml11-doc')

build(){
  cd "$srcdir/xhtml11-${_version}"
  sed -i 's%http://www.w3.org/TR/xhtml-modularization/%../xhtml-modularization-1/%g' *.html
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/doc"
  cp -rf "xhtml11-${_version}" "$pkgdir/usr/share/doc/xhtml-1"
}
