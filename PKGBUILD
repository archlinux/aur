# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

pkgname=beamer-theme-hsrm-git
pkgver=r10.600bcdc
pkgrel=1
pkgdesc="A pretty theme for LaTeX Beamer"
arch=(any)
url="https://github.com/benjamin-weiss/hsrmbeamertheme"
license=('GLP')
depends=('texlive-core')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
source=('git://github.com/benjamin-weiss/hsrmbeamertheme.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/hsrmbeamertheme
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"/hsrmbeamertheme
        mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/theme

        install -m644 beamerthemehsrm.sty \
                "$pkgdir/usr/share/texmf-dist/tex/latex/beamer/themes/theme/"
}
