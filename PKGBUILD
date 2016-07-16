# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=2016.06.28
pkgrel=3
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
install=texlive-acrotex.install
source=("http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip")
md5sums=('9636e5a70c24878e03b47b438e7dd6e9')
sha1sums=('67182d9da4a37cb0dff1b5168b51f9632dccc8c8')
sha256sums=('dbdbe70e1f4b462a5bbe6143e96d1d7b18de15bcc2c39ec202dbcc6e82cb454c')
sha384sums=('69aa85ce6dad0c663fbdb9cd0e2a2a3f798ce214780bf9fad205fa81033038a4401a45559e384f7cdde41b7146b10817')
sha512sums=('5ad6352a181e0adcf6d08e4e905e97a9a8fb4bb1fa9c6926f257dac6bd20e61e87ba601084b8a5717d75701499066f95d3f603429ebc6cabe0696bcc4a2e15f0')

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
