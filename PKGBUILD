# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=2016.04.18
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
install=texlive-acrotex.install
source=(http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip)
md5sums=('43e7595b857544eed5bd1098c1ecdce8')
sha1sums=('ed26f9ec2a2d98da4ef36dce14a2723b4c6a111f')
sha256sums=('aab06edf615a794e25969fdd63df45d637f72bd3e6742cbde38c9cd13bce84a7')
sha384sums=('36eb655bab4242937b76b30f6d79a510298748285c3ed9a11a59492149fe8c25d83da8569ed9d984e171e93e53905db0')
sha512sums=('ba1bbcc63777c0973917302bffe40507dd04d7b2e7229a4ee7626c876321a145e4f1744ac17300cc9988eed84a4f0a6c56a1e542adb7d7f4a29ff4b19f13e80c')

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
