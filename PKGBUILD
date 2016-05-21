# Use http://www.rot13.com/ to decipher address.
# Maintainer: Daniele Bartolini <qonegbyvav.nn [4G] tznvy [Q0G] pbz>

pkgname=pepper
pkgver=0.0.16
pkgrel=5
pkgdesc="The Flexible Game Engine"
arch=(x86_64)
url="https://github.com/taylor001/crown"
license=('MIT' 'GPL')
depends=('libx11' 'libxrandr' 'libpulse' 'gtk3' 'glib2')
source=("https://github.com/taylor001/crown/releases/download/v$pkgver/$pkgname-$pkgver-linux-x64.tar.gz"
        "pepper.sh"
        "pepper.desktop"
        )
md5sums=('c8855a061f90e34adc4e7547d862bff6'
         'ce9c45eea75415c16cd552d219e0bde4'
         '8985c3bf9188e25ae8a0801f34a02491')

package() {
    mkdir $pkgdir/opt
    mkdir $pkgdir/opt/pepper
    cp -r $pkgname $pkgdir/opt/
    install -D -m755 pepper.sh "${pkgdir}/usr/bin/pepper"
    install -D -m644 pepper.desktop "${pkgdir}/usr/share/applications/pepper.desktop"
    install -D -m644 $pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
