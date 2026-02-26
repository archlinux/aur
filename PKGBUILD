# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=csdr-skimmer
pkgver=1.10
pkgrel=1
pkgdesc="CSDR-based CW and RTTY skimmers"
arch=('x86_64' 'aarch64')
url="https://github.com/luarvique/csdr-skimmer"
license=('GPL-3.0-only')
depends=('fftw' 'csdr')
makedepends=('git')
conflicts=('csdr-cwskimmer')
replaces=('csdr-cwskimmer')
source=("$pkgname::git+https://github.com/luarvique/csdr-skimmer.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    make all
}

package() {
    install -Dm 0755 "$srcdir/$pkgname/csdr-cwskimmer" "$pkgdir/usr/bin/csdr-cwskimmer"
    install -Dm 0755 "$srcdir/$pkgname/csdr-rttyskimmer" "$pkgdir/usr/bin/csdr-rttyskimmer"
    install -Dm 0644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
