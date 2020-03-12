# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: N. Izumi aka izmntuk

pkgname=otf-russkopis
_fontname=Russkopis
pkgver=0.0.1
pkgrel=3
pkgdesc='A Free Cyrillic cursive font for Russian, Ukrainian, Belarusian, and Bulgarian'
url='https://github.com/MihailJP/Russkopis'
license=('X11')
arch=('any')
makedepends=('fontforge')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MihailJP/$_fontname/archive/$pkgver.tar.gz")
sha256sums=('1ac0338ea957b553cdcb427fdab0ccbeb66685c45fd2852fa7371407605b577b')

build() {
    cd "$_fontname-$pkgver"
    make
}

package() {
    cd "$_fontname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" "$_fontname-"{Normalny,Zhirny}.otf
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README{,.{ja,ru}.utf8}
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE AUTHORS
}
