# Maintainer:maz-1 <loveayawaka at gmail dot com>

pkgname=gimp-plugin-pspi
_pkgname=gimp-pspi
pkgver=1.0.7
pkgrel=5
pkgdesc='Pspi is a GIMP plug-in that runs 3rd-party Photoshop plug-in filters.'
arch=('i686' 'x86_64')
url='http://the-tml.net/gimp/pspi.html'
license=('MIT')
depends=('gimp' 'wine')
depends_i686=( 'libpng12' 'cairo' 'glitz')
depends_x86_64=( 'lib32-libpng12' 'lib32-glitz' 'lib32-cairo' 'lib32-gimp')
source=(
    "http://the-tml.net/gimp/${_pkgname}-${pkgver}.suse10.i386.tar.gz"
    license
)
#source=("http://the-tml.net/gimp/${_pkgname}-${pkgver}.tar.gz")

build() {
	cd "${srcdir}"
#    cd "${srcdir}/pspi-${pkgver}"
#    winegcc -o pspi *.o $(pkg-config --libs gimp-2.0) $(pkg-config --libs gimpui-2.0) -ladvapi32 -lgdi32

    
}

package() {
	cd "${srcdir}"
	install -Dm755 pspi        $pkgdir/usr/lib/gimp/2.0/plug-ins/pspi
    install -Dm644 pspi.exe.so $pkgdir/usr/lib/gimp/2.0/plug-ins/pspi.exe.so
    install -Dm644 license     $pkgdir/usr/share/licenses/${pkgname}/license
	
	
}

#source
#md5sums=('6820d7963f78c97ffcc1b6ce7c858772')
#binary
md5sums=('01a465b0773f1f3cbded197dc1580c06'
         '6a1522ad01ba6bc0d6773cd38ad5e240')
