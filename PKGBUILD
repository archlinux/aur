# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=7.7h
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
install=texlive-acrotex.install
source=(http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip)
md5sums=('1beceecb5782954f405992f8f93047d0')
sha1sums=('54997de0cc5b421780f9bb2591daacc8acef8235')
sha256sums=('2ffec0649bc5adcdfcd46f9932a78c4ddaba48ebba1fdb27f9ac03b2648b62d6')
sha384sums=('11ee2e2197396593030cf719257fedee2e21f81aee92e3c935b23188f8987f82c124172fe1ff84c9ceb14cb03897a670')
sha512sums=('03e82b6bf02e5d572d54856189d852fb05e748ae42541a2e8b26b9bc90ea6db830bed2e35f4e0760d1a297a2c6d6c6a6fc4aa20099770ec1cb7532ef319e71aa')

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
