# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=beamer-theme-metropolis
pkgver=1.1
pkgrel=1
pkgdesc="A modern LaTeX Beamer theme"
url="https://github.com/matze/mtheme"
arch=("any")
license=("custom:cc-by-sa-4.0")
depends=("texlive-core" "texlive-pictures" "ttf-fira-sans" "ttf-fira-mono")
source=("https://github.com/matze/mtheme/archive/v${pkgver}.tar.gz")
install=metropolis-theme.install
sha512sums=('36eb3778e0acf75539e2d8d930ebc81202a4a6648d485963010459f25424a334c4bdf5d10f9619415908564faa282f726913ba3eba8a498f0ec9e286181540d2')

build() {
    # Generate the style files.
    cd $srcdir/mtheme-${pkgver}
    make
}

package() {
    TEXMFDIST=$(kpsewhich -var-value=TEXMFDIST)
    cd $srcdir/mtheme-${pkgver}
    make DESTDIR=$pkgdir/$TEXMFDIST install
}
