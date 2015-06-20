# Maintainer: Eric Anderson <ejona86@gmail.com>
pkgname=frcursive
pkgver=20111109
pkgrel=1
pkgdesc="French cursive hand fonts from CTAN (for texlive)"
arch=('any')
license=('LPPL')
url=("http://www.ctan.org/tex-archive/fonts/frcursive/")
depends=(texlive-core)
install=$pkgname.install
source=(http://mirror.ctan.org/fonts/$pkgname.zip)
sha1sums=('8ba9222801483fd2146da04b3cbfd949d8de8bff')

package() {
  cd $srcdir/$pkgname
  TEXMF=usr/share/texmf
  install -d $pkgdir/$TEXMF/tex/latex/$pkgname
  install -m 644 latex/* \
    $pkgdir/$TEXMF/tex/latex/$pkgname
  install -d $pkgdir/$TEXMF/fonts/mf/public/$pkgname
  install -m 644 mf/* \
    $pkgdir/$TEXMF/fonts/mf/public/$pkgname
  install -d $pkgdir/$TEXMF/fonts/type1/public/$pkgname
  install -m 644 type1/* \
    $pkgdir/$TEXMF/fonts/type1/public/$pkgname
  install -d $pkgdir/$TEXMF/fonts/tfm/public/$pkgname
  install -m 644 tfm/* \
    $pkgdir/$TEXMF/fonts/tfm/public/$pkgname

  install -d $pkgdir/$TEXMF/fonts/map/dvips/$pkgname
  install -m 644 frcursive.map \
    $pkgdir/$TEXMF/fonts/map/dvips/$pkgname
}
