# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>

pkgname=kaobook
pkgver=0.9.6
pkgrel=1
pkgdesc='A LaTeX class for books, reports or theses'
arch=('any')
url='https://github.com/fmarotta/kaobook'
license=('LPPL')
depends=('texlive-core')
source=(https://github.com/fmarotta/$pkgname/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('81ef3bc3af01cd6a81955bd3a837adcd3cb80bf9e510c60f1821680f44ff0f5c')

package() {
  cd "$srcdir"
  
  mkdir -p "$pkgdir"/usr/share/texmf/tex/latex/kaobook/styles/
  
  install -m444 "$srcdir"/$pkgname-$pkgver/kaohandt.cls "$pkgdir"/usr/share/texmf/tex/latex/kaobook/
  install -m444 "$srcdir"/$pkgname-$pkgver/kaobook.cls "$pkgdir"/usr/share/texmf/tex/latex/kaobook/
  
  for file in "$srcdir"/$pkgname-$pkgver/styles/*.sty; do
    install -m 444 "$file" "$pkgdir"/usr/share/texmf/tex/latex/kaobook/styles/
  done
}
