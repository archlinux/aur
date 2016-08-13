# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=2016.07.31
pkgrel=2
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
install=texlive-acrotex.install
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip")
md5sums=('baf7de6ba36c82e6de4b2375668e84c4')
sha1sums=('e4bce330857a047c1957cc7b9f502b50d05b2698')
sha256sums=('c2925120ddd96edfdb19919867c1d5d95d2c3727d9bf3f873586dafa005db05c')
sha384sums=('627120d257eff837febfcde14f635910c92f0b34c61d5281afabd5932da8cc01c78039b64277bea94c12f1a42fcf05b5')
sha512sums=('2868233049cc73eff36b01e1d8df999859c6a4a9db2b8d4c208bc7c47e4a1f6a14cbfbeac772af96d51051b679e48493f518fa848fb133e1aa33cf35c125d9a6')

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
