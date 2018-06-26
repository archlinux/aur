# Maintainer: Ivan Burmin <osguot@gmail.com>

pkgname='arxfatalis-data-steam'
pkgver=1.21
pkgrel=1
pkgdesc='Arx Fatalis game data from Steam. Multilingual.'
arch=('any')
url='https://store.steampowered.com/app/1700/Arx_Fatalis/'
license=('custom:commercial')
makedepends_x86_64=('lib32-gcc-libs')
optdepends=('arxlibertatis-bin:  native Linux game executable (only binaries)'
            'arxlibertatis-git:  native Linux game executable (git version)'
            'arxlibertatis:  native Linux game executable (from source)')
source=("https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz"
        "arx-downloader")
md5sums=('70a38a1c8688d170c48b7f4990782c7a'
         'c9e1fcdbde783842b62d9c4593fda639')
         
build() {
    
    cd $srcdir
    bsdtar xf steamcmd_linux.tar.gz
    
    chmod +x arx-downloader
    ./arx-downloader
    
}
         
package() {

    mkdir -p $pkgdir/usr/share
    cp -r arx $pkgdir/usr/share

}
