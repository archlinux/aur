# Maintainer: Eric Anderson <ejona86@gmail.com>
pkgname=frcursive
pkgver=20111109
pkgrel=2
pkgdesc="French cursive hand fonts from CTAN (for texlive)"
arch=('any')
license=('LPPL')
url="http://www.ctan.org/tex-archive/fonts/frcursive/"
depends=(texlive-core)
source=("http://mirror.ctan.org/fonts/$pkgname.zip"
        "$pkgname.maps")
sha256sums=('7f33d137168b9acdedc1950e0b711ce7d2d3c72c8fa8e250023209c0240177ca'
            '0ec11b1835b88a7128d747bce86e8d22a3221b585d9b067527cc5b369df79df1')

package() {
  cd "$srcdir"
  install -m755 -d $pkgdir/var/lib/texmf/arch/installedpkgs
  install -m644 $pkgname.maps $pkgdir/var/lib/texmf/arch/installedpkgs/

  cd "$srcdir/$pkgname"
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
