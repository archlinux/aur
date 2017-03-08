# Maintainer: PoroCYon <qpspdzpo@pqfonbjmcny.psh>
# easy-to-break caesar cipher,  ^
# but tends to keep crawlers out

pkgname=siv-git
pkgver=66369be
pkgrel=1
pkgdesc="A command-line control program for Zif (git version)"
arch=('x86_64' 'i686')
url="https://gitlab.com/PoroCYon/siv"
license=('GPL3')
depends=('libffi' 'gmp') # 'zifd')
makedepends=('stack' 'ghc')
#groups=('zif')
#provides=('siv')
#conflicts=('siv')
source=("git+https://gitlab.com/PoroCYon/siv")
sha512sums=('SKIP')

#pkgver() {
#	cd "siv"
#	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
#}

build() {
	cd "siv"
	stack build --ghc-options -j$(nproc)
}

package() {
	cd "siv"
	install -D -m755 .stack-work/install/*/*/*/bin/siv $pkgdir/usr/bin/siv
}

