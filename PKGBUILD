# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=beamer-themes-kmaeda-git
pkgver=r32.6486ea7
pkgrel=1
pkgdesc="Theme collection by kmaeda"
arch=(any)
url="https://github.com/kmaed/kmbeamer/"
license=('unknown')
depends=('texlive-core')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
source=('git://github.com/kmaed/kmbeamer.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/kmbeamer
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"/kmbeamer
        mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/{color,font,theme}

        install -m644 beamercolortheme*.sty \
                "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/color/"

        install -m644 kmbeamer_*.sty \
                "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/color/"

        install -m644 beamerfontthemeluatexja.sty \
                "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/font/"

        install -m644 beamertheme*.sty \
                "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/theme/"

}
