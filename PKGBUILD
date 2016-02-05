# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=7.7g
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
install=texlive-acrotex.install
source=(http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip)
md5sums=('479035c2ef622a5d7c4d27684c1aa8fc')
sha1sums=('b8d9d2ee96c1e4fae7a80bee23283ed106a82919')
sha256sums=('671229ec74a79e029163fe29ecac11cb3037bd5461f614060dd58455ff362d94')
sha384sums=('6aabf3aef7ee99ae2ce220d8e230695337ca41ac5b7a43b51fcc071bf97f17e34431ba1210aa594e2e165662caa053a2')
sha512sums=('e3a9b3a756fcd28471031b42e521701abd0d5294734f18184520db9da60381bb673ee708655ca339a57e9ce5926d324acfc6ac533ce06a3a411bffb540fc5668')

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
