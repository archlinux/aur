# Maintainer: Sean Enck <enckse@gmail.com>
pkgname=texlive-conv-xkv
pkgver=2017.01.09
pkgrel=1
license=('LPPL')
depends=('texlive-core')
pkgdesc="This small package supports key-value syntax other than the standard latex syntax of <key>=<value>"
url="http://www.ctan.org/tex-archive/macros/latex/contrib/conv-xkv"
arch=('any')
source=("$pkgname-$pkgver.zip::http://mirrors.ctan.org/macros/latex/contrib/conv-xkv.zip")
sha256sums=('24ef8b121d2d6a7f0fb6d46cbabe1891925ea54ac315fa7d9f1d37b5bf3bd4e8')

build()
{
 cd $srcdir/conv-xkv
 latex conv-xkv.ins
}

package()
{
  cd $srcdir/conv-xkv

  mkdir -p $pkgdir/usr/share/texmf/tex/latex/conv-xkv
  cp *.sty $pkgdir/usr/share/texmf/tex/latex/conv-xkv
  mkdir -p $pkgdir/usr/share/doc/${pkgname}
  cd $srcdir/conv-xkv/doc
  cp * $pkgdir/usr/share/doc/${pkgname}
}
