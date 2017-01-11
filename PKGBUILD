# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=2017.01.08
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip")
md5sums=('de13a6450c327a6601daf8dd5ca3ca4f')
sha1sums=('e285d87b91ba2b7853b45a41210297ea5d41234f')
sha256sums=('66836e1505fadda26e2876cb7b8214dc6d5613322790244c07b15b25100b41a4')
sha384sums=('af7dd1fa705fb02bdd01ccef672454e3784dffa3da1163bb830815137b4dec564982b89736c56474566f766584681807')
sha512sums=('2bdaa338e1bcb4f4100b7f5708cf5d76bb6887a4691ff8c9862f679f7276f6f1ffafc3797ba49a8d1267d69e9b4b36a4300477112a9855a7b0ab56574e7124ed')

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
