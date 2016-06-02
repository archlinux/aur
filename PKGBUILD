# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=2016.06.01
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
install=texlive-acrotex.install
source=(http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip)
md5sums=('e7cd842997ab94ec581d94996b38e359')
sha1sums=('7f8b14dbea2b6935b7fb83394c32b66bf52853f3')
sha256sums=('bd304b9c04e32e580a2f0330c66292933b796d67f712695ec727e10642fb4146')
sha384sums=('9f8eaad7e27a01e71e517763c0fa35d40cc4846e6f9c26330c35c0c0887b1d16ef3cf6128241072398149549dcd9e02b')
sha512sums=('378fa82e079a696886b12a2248aee3dcc590aaf55740e20e55c888067b3ecdc28aab934fcc86d9ad9c3b07acd8fc07b7aa1f49c64ac9dcf4943040aa718dd01e')

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
