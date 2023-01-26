# Maintainer: Evann DREUMONT <hello(at)evann(dot)tech>

pkgname=newtex-git
pkgver=r9.a35a4ee
pkgrel=1
pkgdesc='A modern LaTeX class'
arch=('any')
url='https://github.com/leGmask/NewTeX'
license=('MIT')
depends=('texlive-core' 'ttf-rubik' 'ttf-fira-code' 'minted')
source=('NewTeX::git+https://github.com/LeGmask/NewTeX.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

  cd "$srcdir"

  mkdir -p "$pkgdir"/usr/share/texmf/tex/latex/NewTeX

  install -m444 "$srcdir"/NewTeX/NewTeX.cls "$pkgdir"/usr/share/texmf/tex/latex/NewTeX/
}

