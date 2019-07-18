# Maintainer: McLenin <mclenin at gooogles email>
pkgname=texlive-acrotex
pkgver=2019.07.18
pkgrel=1
license=('GPL')
depends=('texlive-core')
pkgdesc="A LaTeX bundle for webpages, pdf forms and includin JavaSript into LaTeX"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/acrotex"
arch=('any')
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/macros/latex/contrib/acrotex.zip")
md5sums=('edb81424e8f04306d27ad50c167d35cc')
sha1sums=('fa6f0dd75532250a96898027e1cacd7edb61ccf1')
sha256sums=('320e33529f934659f5829824c6f2e326965277cbf1f1624f623aa19952e06ae5')
sha384sums=('e2093c67f97fb57ce1aaee72522635749f5f6704acee1231c35bdd73fa25222ce8b47f74ee0f57b4ec1d515593b6fe0f')
sha512sums=('59432d50f5beea0da2bba95b794a4aadeb563c4ae62f5aaee6ba36dbc8c96ae08c2b3cd0cd91a3bc51f5498ba7b5a121fe4e060cac094567b3d609a69cb1ccbd')

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
