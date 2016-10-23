# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=2016.10.13
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
install=texlive-acrotex.install
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip")
md5sums=('748e28a457e07012d371daf5f244c2ce')
sha1sums=('659f7727a29f931a43635fd38b6487be80a2d1d2')
sha256sums=('0156438b984c58ee0ed2c8c6dfa471ba0a81df4505f649d936f5e1247fb5f439')
sha384sums=('383a694ba2a9e6bafccf3ff123ed31f0210715aadd2cc6bb8c0d1336de89b11b108de590abbb3cfbbd1e9036e1de76fc')
sha512sums=('d862d0da479231bc2ae8addbf762822030eb9cc4544baa2c6147542110d0a2e5dec9308f501a97d8e684b18ecc5cb01cbb4db6ceef9203c7c87259ee73e24e87')

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
