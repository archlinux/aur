# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=imagej-plugins-embl
_pkgname=EMBL_ImageJ_plugins
pkgver=20130120
pkgrel=1
pkgdesc="ImageJ plugin collection by the EMBL"
arch=('any')
url="http://www.embl.de/almf/almf_services/services/downloads/imageJ/"
license=('GPL')
depends=('imagej')
makedepends=('unzip')
optdepends=('java-environment')
source=("http://www.embl.de/download/almf/$_pkgname.zip")
noextract=("$_pkgname.zip")
md5sums=('097f778d804c2506dbd8a1219267dc3b')

package() {
    mkdir -p "$pkgdir/usr/share/imagej"
    unzip -d "$pkgdir/usr/share/imagej" "$srcdir/$_pkgname.zip"

    # remove plugins already in standard distribution
    rm "$pkgdir/usr/share/imagej/plugins/Particle Analysis/Cell_Counter.jar"
    rm "$pkgdir/usr/share/imagej/plugins/Stacks - Z-functions/Volume_Viewer.jar"
    rm "$pkgdir/usr/share/imagej/plugins/Exif_Reader.jar"
}

