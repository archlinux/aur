# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

_pkgname=orbit-cv
pkgname=texlive-orbit-cv-git
pkgver=e4207eb
pkgrel=1
pkgdesc="LaTeX port of the Hugo Orbit CV theme"
arch=("any")
url="https://github.com/mvarela/orbit-cv"
license=("MIT")
depends=("texlive-core" "texlive-latexextra" "fontawesome.sty" "ttf-roboto")
makedepends=("git")
source=("git+https://github.com/mvarela/orbit-cv")
md5sums=("SKIP")

pkgver() {
    cd $srcdir/$_pkgname
    git describe --always
}

package() {
    cd $srcdir/$_pkgname
    install -Dm644 orbit-cv.cls $pkgdir/usr/share/texmf/tex/latex/$_pkgname/orbit-cv.cls
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$_pkgname/license
}

