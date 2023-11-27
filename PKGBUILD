# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=css-2-docs
_version=20110607
pkgver=2.1.${_version}
pkgrel=3
pkgdesc="Cascading Style Sheets Level 2 Revision 1 (CSS 2.1) Specification"
arch=('any')
url="http://www.w3.org/TR/CSS2/"
license=(custom:"W3C document license")
options=('docs' '!strip' '!libtool' '!staticlibs' '!zipman')
source=("http://www.w3.org/TR/2011/REC-CSS2-${_version}/css2.tgz")
sha256sums=('6546858f785a498fa21d1fcd8192907e9cedbd20bf10142bdd5838498f5a46b8')
noextract=('css2.tgz')
replaces=('css21-doc')

build() {
  cd "$srcdir"
  mkdir -p css-2
  cd css-2
  tar xaf ../css2.tgz

  # 20110607 CSS 2.1 recommendation images/clip.png wasn't world-readable
  chmod -R a+r .
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/doc"
  cp -rf css-2 "$pkgdir/usr/share/doc"
}
