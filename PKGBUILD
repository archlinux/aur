# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=2018.03.22
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip")
md5sums=('aa9c02cd4a1cd83d00ce3a87cd80843a')
sha1sums=('0ae2a72efc6bcf9faf7f647cafdcf646a27dce74')
sha256sums=('7bda228ed6ae91d55ad97723c783731b5f0315ad4478d7efb4001585e054c087')
sha384sums=('14e5b0ecc17c9059ef55997cc136b072e540e67f8b7cf251bf1fc3ecc3dd85ca1c31d326b614611449ccde32b438a060')
sha512sums=('a5126739fd53276675aa02b18e7abf166edbb6653ad8f58474212d6581873af6991cc7dafdc558bbddd4542f4771be131ceeb0d5dea0b9dab2e66d2fbfeb08eb')

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
