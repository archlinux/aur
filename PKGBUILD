# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=2017.08.08
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip")
md5sums=('027671a82795c68fd15c435711da724d')
sha1sums=('4fb1ab05a65e99a4bfa1ba32cf22005d8d3f63d3')
sha256sums=('264af033862c39426c855f15d0960e22989a3a36bcab97facf09f5cd5f70bba2')
sha384sums=('0b73899d679375c923037b9e2b0b42ac8a6a3d8389f906a202264d17d2105489856946d47421c3ffda4164d4d6e69a2d')
sha512sums=('708b4be124debe51679b62407627a85bcb1337f8dd48783bd626f8728c0e771f45fa0660a26ca2babb3cd57155466e04927fbd631aefe0c3e7f3b764f44cef69')

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
