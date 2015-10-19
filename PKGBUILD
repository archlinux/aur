# Maintainer: Luc J. Bourhis <https://aur.archlinux.org/account/ljbo>

pkgname=texlive-mtheme
pkgver=r309.0a18f19
pkgrel=1
license=('CCPL/cc-by-sa')
depends=('texlive-core' 'texlive-latexextra' 'ttf-fira-sans' 'ttf-fira-mono')
pkgdesc='A modern LaTeX Beamer theme'
url='http://bloerg.net/2014/09/20/a-modern-beamer-theme.html'
arch=('any')
source=('texlive-mtheme::git+http://github.com/luc-j-bourhis/mtheme.git#commit=0a18f1979cdb065c4792126d6f91444e9429f192')
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make all
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/$(kpsewhich -var-value=TEXMFDIST)" install
}

