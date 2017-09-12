# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=2017.09.06
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip")
md5sums=('91b0df8ee7ba9a1ee0277d4de8992187')
sha1sums=('921469c7e475c9ac26623c565f2a54daf1ea5529')
sha256sums=('320ad983fc717d2ae845084d7aa893830377cf8adafc151292001c91d7317125')
sha384sums=('bc748b938b1edf65a68928b6b1127453c76e42b69f2e4e6e0ee86a35c980946396b5cd664920329fb3b04a020302ac42')
sha512sums=('47051478274ad0c7f762107e9f02910d7c3d5331cc45560c9786b266a325c76daa2b7a456049c952743aceb3ea2bfcddc05533aac38cf8fcdc20bf4f11d79b3b')

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
