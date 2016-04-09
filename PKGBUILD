# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=7.7j
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
install=texlive-acrotex.install
source=(http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip)
md5sums=('c10729011acdc00891b28178fff7f14e')
sha1sums=('cd2b576b89a3b7081f21b5fc18cf5959907b50b6')
sha256sums=('2b7bdd88bcd0ca4d8c92e98702ec5d128cb03298988568eaba576622d534d2ab')
sha384sums=('6c2ba6cde59ce33b6af1224e135cd31495198eb33f076e1151415229a1a557436b23c981a89ab3ff4410f0d44f1af1f3')
sha512sums=('8681b5b41a6e9c5483863a07547a9f895b415aabc133b9cf39d82b65753204edad6130a714b8896bf58d3cc94efa66338f3dfcdd97d8377dd179ba5b7f26dca2')

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
