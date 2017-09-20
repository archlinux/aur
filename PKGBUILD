# Contributor: solnce <solnce at ratajczak dot one>
# Maintainer: solnce <solnce at ratajczak dot one>
# original code by Sunday87: https://bbs.archlinux.org/viewtopic.php?pid=1253365#p1253365

pkgname=texlive-most-doc
pkgver=20170920
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
  wget -r -l inf -N -nH -nv --cut-dirs=3 -P "$srcdir/usr/share/" ftp://tug.org/texlive/Contents/live/texmf/doc/asymptote
  wget -r -l inf -N -nH -nv --cut-dirs=3 -P "$srcdir/usr/share/" ftp://tug.org/texlive/Contents/live/texmf/doc/dvipng/dvipng.pdf
  wget -r -l inf -N -nH -nv --cut-dirs=3 -P "$srcdir/usr/share/" ftp://tug.org/texlive/Contents/live/texmf/doc/dvips/dvips.pdf
  wget -r -l inf -N -nH -nv --cut-dirs=3 -P "$srcdir/usr/share/" ftp://tug.org/texlive/Contents/live/texmf/doc/man
  wget -r -l inf -N -nH -nv --cut-dirs=3 -P "$srcdir/usr/share/" ftp://tug.org/texlive/Contents/live/texmf/doc/info
  wget -r -l inf -N -nH -nv --cut-dirs=3 -P "$srcdir/usr/share/" ftp://tug.org/texlive/Contents/live/texmf/doc/tetex
  wget -r -l inf -N -nH -nv --cut-dirs=3 -P "$srcdir/usr/share/" ftp://tug.org/texlive/Contents/live/texmf/doc/texlive
  wget -r -l inf -N -nH -nv --cut-dirs=3 -P "$srcdir/usr/share/" ftp://tug.org/texlive/Contents/live/texmf/doc/texworks
  wget -r -l inf -N -nH -nv --cut-dirs=3 -P "$srcdir/usr/share/" ftp://tug.org/texlive/Contents/live/texmf/doc/web2c/web2c.pdf
  wget -r -l inf -N -nH -nv --cut-dirs=3 -P "$srcdir/usr/share/" ftp://tug.org/texlive/Contents/live/texmf/doc/ttf2pk/ttf2tfm.txt
  wget -r -l inf -N -nH -nv --cut-dirs=3 -P "$srcdir/usr/share/" ftp://tug.org/texlive/Contents/live/texmf/doc/ttf2pk/ttf2pk.txt
}

package() {
  cp -rl "$srcdir"/* "$pkgdir"
}
