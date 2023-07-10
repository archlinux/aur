pkgname=artisan-roaster-scope
pkgver=2.8.4
pkgrel=2
pkgdesc="Artisan is a software that helps coffee roasters record, analyze, and control roast profiles."
arch=("x86_64")
url="https://github.com/artisan-roaster-scope/artisan"
license=('GPL3')
depends=()
source=(
"https://github.com/artisan-roaster-scope/artisan/releases/download/v${pkgver}/artisan-linux-${pkgver}.deb"
)
sha256sums=(
'7b768d3473c68672528b65b76b7df2e22167846ba9413d9dca9c0dad17879465'
)
options+=(!strip) # stripping causes crashes

prepare() {
	tar -xf data.tar.gz
	sed -i 's/x86_64-linux-gnu\///g' ${srcdir}/usr/bin/artisan
}

package() {
	cp -r ${srcdir}/usr ${pkgdir}/
}
