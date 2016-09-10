# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=2016.08.29
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
install=texlive-acrotex.install
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip")
md5sums=('780184b75872c67983c0fecd9ff0e866')
sha1sums=('3bdd4afaead5dd1a9247ca7b65e9cba347e4876e')
sha256sums=('400eaed24c14fe4ae49bb6b0dab7f920cacfdabc8d9e4b55fa33d5753f3f63c6')
sha384sums=('c134b5a3b605f763bad605e1a615f77b4d6d15c377e61df31cf08d7882aecfb74a2465f6e2bfecf06f3d149e5d362bd4')
sha512sums=('d9ef88138d9ffc6b35479de20dca3b929b4d5299f2d902e6f8daee188c828f8c8e5b060f1159c8a3d01e032f284a1426188c8640ead9f5ad96f84298bef49f3d')

build()
{
 cd $srcdir/acrotex
 latex acrotex.ins
 latex dljslib.ins
 latex eforms.ins
 latex exerquiz.ins
 latex insdljs.ins
 latex taborder.ins
 latex web.ins
}

package()
{
  cd $srcdir/acrotex

  mkdir -p $pkgdir/usr/share/texmf/tex/latex/acrotex
  cp {*.sty,*.def,*.cfg,*.js} $pkgdir/usr/share/texmf/tex/latex/acrotex

  mkdir -p $pkgdir/usr/share/doc/texlive-acrotex
  cd $srcdir/acrotex/doc
  cp * $pkgdir/usr/share/doc/texlive-acrotex
}
