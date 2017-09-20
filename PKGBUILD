# Contributor: solnce <solnce at ratajczak dot one>
# Maintainer: solnce <solnce at ratajczak dot one>
# original code by Sunday87: https://bbs.archlinux.org/viewtopic.php?pid=1253365#p1253365

pkgname=texlive-most-doc
pkgver=20170921
pkgrel=1
pkgdesc="Most TeXLive documentation"
url="http://tug.org/texlive/"
arch=('any')
license=('unknown')
optdepends=('texlive-bin: The texdoc program and some more documentation')
makedepends=('wget')
install='texlive-most-doc.install'
options=('!strip'  '!purge')

build() {
  wget -r -l inf -N -nH -nv --cut-dirs=3 -P "$srcdir/usr/share/" ftp://tug.org/texlive/Contents/live/texmf-dist/doc
}

package() {
  cp -rl "$srcdir"/* "$pkgdir"
}
