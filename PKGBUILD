# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=csdr-skimmer
pkgver=1.5
pkgrel=1
pkgdesc="CSDR-based CW and RTTY skimmers"
arch=('x86_64' 'aarch64')
url="https://github.com/luarvique/csdr-skimmer"
license=('GPL3')
depends=('fftw' 'csdr')
makedepends=('git' 'make')
conflicts=('csdr-cwskimmer')
replaces=('csdr-cwskimmer')
source=("$pkgname"::"git+https://github.com/luarvique/csdr-cwskimmer.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    make all
}

package() {
    install -Dm 0755 "$srcdir/$pkgname/csdr-cwskimmer" "$pkgdir/usr/bin/csdr-cwskimmer"
    install -Dm 0755 "$srcdir/$pkgname/csdr-rttyskimmer" "$pkgdir/usr/bin/csdr-rttyskimmer"
}
