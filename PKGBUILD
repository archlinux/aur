# Contributor: Paolo Palmieri <palmaway@gmx.it>
# Contributor: Alessio 'Bl@ster' Biancalana <dottorblaster@archlinux.us>
# Contributor: Federico Giuliani <federico.giuliani86@gmail.com>

pkgname=fortune-mod-it
pkgver=1.99
pkgrel=3
pkgdesc="Collection of Italian fortune cookie files"
url="http://www.fortune-it.net/"
arch=('any')
depends=('fortune-mod')
groups=('fortune-mods')
license=('custom')
source=(http://www.fortune-it.net/download/fortune-it-1.99.tar.gz)
md5sums=('b395af4484a8101a3f92163ab8667d8b')

package(){
    cd ${srcdir}/fortune-it-${pkgver}/testi
    mkdir -p ${pkgdir}/usr/share/fortune/it
    cp -v * ${pkgdir}/usr/share/fortune/it

    cd ${pkgdir}/usr/share/fortune/it
    for _file in *; do
        strfile $_file
    done
    
    mkdir -p ${pkgdir}/usr/share/fortune/it-off
    mv ${pkgdir}/usr/share/fortune/it/*-o* ${pkgdir}/usr/share/fortune/it-off/

    cd ${srcdir}/fortune-it-${pkgver}/
    mkdir -p ${pkgdir}/usr/share/licenses/custom/fortune-mod-it/
    cp COPYING ${pkgdir}/usr/share/licenses/custom/fortune-mod-it/COPYING
}
