# Maintainer: Luc J. Bourhis <https://aur.archlinux.org/account/ljbo>

pkgname=texlive-mtheme
pkgver=r310.eb5a7d7
pkgrel=1
license=('CCPL/cc-by-sa')
depends=('texlive-core' 'texlive-latexextra' 'ttf-fira-sans' 'ttf-fira-mono')
pkgdesc='A modern LaTeX Beamer theme'
url='http://bloerg.net/2014/09/20/a-modern-beamer-theme.html'
arch=('any')
source=('texlive-mtheme::git+http://github.com/matze/mtheme.git#commit=eb5a7d7c9d64eeccf1913baa3234ac51ca7da139')
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

