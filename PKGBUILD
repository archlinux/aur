# Maintainer: SanskritFritz (gmail)

pkgname=ttf-sarala-git
_gitname=sarala
pkgver=r39.7779e0c
pkgrel=1
pkgdesc="Humanist sans serif conceived to be a web font with nice legibility at normal text sizes. Based on Telex Regular free font."
arch=('any')
url="https://github.com/huertatipografica/sarala"
license=('OFL')

source=("git+https://github.com/huertatipografica/sarala.git")

md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir --parents "$pkgdir/usr/share/fonts/OTF"
  cp "$srcdir/$_gitname"/font/*.otf "$pkgdir/usr/share/fonts/OTF/"
  mkdir --parents "$pkgdir/usr/share/doc/sarala"
  cp "$srcdir/$_gitname"/README.md "$pkgdir/usr/share/doc/sarala/"
}

# vim:set ts=2 sw=2 et:
