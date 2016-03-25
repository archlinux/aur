# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=7.7i
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
install=texlive-acrotex.install
source=(http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip)
md5sums=('c7576b99267eb7ee66b3dceda63309fa')
sha1sums=('9415b4c673f595bd9975bb1326874100deefdbeb')
sha256sums=('00265b838f8df3a00c01d0bfc156bea945beefb4e6ef88ed9b359f51966dbe6f')
sha384sums=('69464c9739ae1ec61f769d9a5262e73050cbdcbeb872699164e4c9a2a14b69f0d9fc5d67ebfc8895a3537fb09d087cba')
sha512sums=('8e11b0fd16cb03d6db5f429d0cfc9ba87339ea937ad39f13895633a936ea67db2e0d0ec51529c40cddfface683c4a18a1c1425268e022988197d3658d9590bf4')

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
