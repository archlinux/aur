# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
pkgname="texlive-kufront-git"
pkgver=r15.bcc105f
pkgrel=1
pkgdesc="LaTeX frontpage with University of Copenhagen logo"
arch=('any')
url="https://github.com/mbudde/kufront"
license=('unknown')
depends=('texlive-core')
makedepends=('git')
source=("${pkgname}::git+https://github.com/mbudde/kufront.git")
install="${pkgname}.install"
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mydir="${pkgdir}/usr/share/texmf-dist/tex/latex/kufront/"
    install -d -m 755 $mydir

    cp -dpr --no-preserve=ownership "${srcdir}/${pkgname}/"* $mydir
    rm $mydir/example.{tex,pdf}
}
