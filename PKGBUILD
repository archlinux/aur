# Maintainer: aksr <aksr at t-com dot me>
pkgname=progdoc
_pkgname=ProgDoc
pkgver=1.3b
pkgrel=1
epoch=
pkgdesc="A Program Documentation System."
arch=('i686' 'x86_64')
url="http://www.progdoc.org/"
license=('GPL')
groups=()
depends=('texlive-core' 'gawk' 'nawk')
makedepends=()
checkdepends=()
optdepends=('latex2html')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=progdoc.install
changelog=
source=("http://www.progdoc.de/projects/progdoc/${_pkgname}_${pkgver}_src.tgz")
noextract=()
md5sums=('427d16534eb6fb4226897753a6b62d90')
sha1sums=('660e41d7c514af49ef741ed2943f249326e841a9')
sha256sums=('a4a8d9266352e498c429430324556174ebf18c1983cab750fba946f7615a462e')

build() {
  cd "$srcdir/$_pkgname/src"
  make all
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 bin/pdhighlight $pkgdir/usr/bin/pdhighlight
  install -Dm755 bin/pdlsthighlight $pkgdir/usr/bin/pdlsthighlight
  install -Dm755 bin/pdweave $pkgdir/usr/bin/pdweave
  install -Dm755 bin/pdweave.awk $pkgdir/usr/bin/pdweave.awk
  install -Dm755 bin/pdweave.nawk $pkgdir/usr/bin/pdweave.nawk
  install -Dm644 doc/tutorial.dvi $pkgdir/usr/share/doc/$pkgname/tutorial.dvi
  install -Dm644 doc/tutorial.pdf $pkgdir/usr/share/doc/$pkgname/tutorial.pdf
  install -Dm644 doc/tutorial.ps $pkgdir/usr/share/doc/$pkgname/tutorial.ps
  install -Dm644 latex/html.sty $pkgdir/usr/share/texmf/tex/latex/$pkgname/html.sty
  install -Dm644 latex/progdoc.sty $pkgdir/usr/share/texmf/tex/latex/$pkgname/progdoc.sty
  install -Dm644 latex2html/.latex2html-init $pkgdir/usr/share/doc/$pkgname/latex2html/.latex2html-init
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

