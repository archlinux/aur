# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=2016.06.28
pkgrel=2
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
install=texlive-acrotex.install
source=("http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip")
md5sums=('f2baea79d4acd8b9e5710589ddd24472')
sha1sums=('3fcab6a229f2c3fd09ae080804c86b275c8f0123')
sha256sums=('0accc84b4e9829a05a3f0a68ad6613fe911f9dc5b32c325d17bca468a2849f55')
sha384sums=('3bd78645b5afc4f0c404afbe8a38ac5ccd441fa243f2ae23f97b47f581a3014acf71d566ca4adc61279e4fffba9f9e88')
sha512sums=('b221e3cb6f8469d8c7cb45ffba30fd50fce7cbcf4a26ec817b601318dc95d5b2cde5af643ae323e9c7f7e660c898acb2f15fe14c2ee6a2303d72c6061b0744fd')

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
