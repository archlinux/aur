# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=2016.12.13
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
install=texlive-acrotex.install
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip")
md5sums=('4131708d2c4599a721d27818b0e8694b')
sha1sums=('7d658f6ac283c870f7d9afcfff76353ed209a7c3')
sha256sums=('404fa42b48685057ea3c0347efb2d10337b4278b6d19db476c0edaca3edca18b')
sha384sums=('5c96a245f91f63f4326f14566248ec1063bb0afadc1f5470c95cbc89ee4f525f4d3c9e003f06b90a06edecbbcf7c4390')
sha512sums=('04192141172b33ff3be979f39bf45180c7d4bfc7e96c0d764164d326f274484fc3e6177dc10f22e6fa0eaaeae78fb03aaf25c8e7bc483561929d39694be3fba7')

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
