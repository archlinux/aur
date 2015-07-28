# Contributor: Paolo Palmieri <palmaway@gmx.it>
# Contributor: Alessio 'Bl@ster' Biancalana <dottorblaster@archlinux.us>

pkgname=fortune-mod-it
pkgver=1.99
pkgrel=2
pkgdesc="Collection of Italian fortune cookie files"
url="http://www.fortune-it.net/"
arch=('any')
depends=('fortune-mod')
groups=('fortune-mods')
license=('custom')
source=(http://www.fortune-it.net/download/fortune-it-1.99.tar.gz)
md5sums=('b395af4484a8101a3f92163ab8667d8b')

build() {
    cd $startdir/src/fortune-it-$pkgver/testi
    mkdir -p $startdir/pkg/usr/share/fortune/it
    cp -v * $startdir/pkg/usr/share/fortune/it

    cd $startdir/pkg/usr/share/fortune/it
    for _file in *; do
        strfile $_file
    done
}

package(){
    mkdir -p $startdir/pkg/usr/share/fortune/off
    mv $startdir/pkg/usr/share/fortune/it/*-o* $startdir/pkg/usr/share/fortune/off/

    cd $startdir/src/fortune-it-$pkgver/
    mkdir -p $startdir/pkg/usr/share/licenses/custom/fortune-mod-it/
    cp COPYING $startdir/pkg/usr/share/licenses/custom/fortune-mod-it/COPYING
}
