# Maintainer: lostmason <lostmason@tutamail.com>
pkgname=ttf-illinois-mono-git
pkgver=r115.g67c38f5
pkgrel=1
pkgdesc="Monospace font based on Lexend"
arch=('any')
url="https://github.com/MadSimple/illinois-mono"
license=('OFL-1.1')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/illinois-mono"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/illinois-mono"

    # Create font directory
    install -d ${pkgdir}/usr/share/fonts/TTF/

    # Install all TTF variants
    install -m644 Illinois_Mono_*.ttf ${pkgdir}/usr/share/fonts/TTF
}
