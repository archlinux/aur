# Maintainer: Joey Dumont <joey.dumont@gmail.com>
pkgname=beamer-theme-metropolis
pkgver=1.0
pkgrel=1
pkgdesc="A modern LaTeX Beamer theme"
url="https://github.com/matze/mtheme"
arch=("any")
license=("custom:cc-by-sa-4.0")
depends=("texlive-core" "texlive-pictures" "ttf-fira-sans" "ttf-fira-mono")
source=("https://github.com/matze/mtheme/archive/v${pkgver}.tar.gz")
install=metropolis-theme.install
sha512sums=('560723f95fdde625e913c3d72f7847b0683be52de1238258cd1a98f6f68b1b42088172d78a7b3eda0abbb06f00b41a1f0c9bcc030143542d8eca5d7f12c6d418')

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
