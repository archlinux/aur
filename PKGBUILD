# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-excessiveplus
pkgver=2.2b
pkgrel=1
pkgdesc="Excessive Plus is a modification for Quake 3 where all weapons are 'excessive'."
url="http://www.excessiveplus.net/"
arch=('any')
license=('custom')
depends=('quake3')
source=("http://www.excessiveplus.net/files/release/xp-${pkgver}.zip")
md5sums=('72a288aef8bfee1bcca782702e40495c')
noextract=("xp-${pkgver}.zip")

build() {
    cd $srcdir
}

package() {
    cd $srcdir

    # Base Excessive Plus Files
    install -d $pkgdir/opt/quake3/
    unzip xp-${pkgver}.zip -d $pkgdir/opt/quake3/

    # Cleanup unneeded files
    cd $pkgdir/opt/quake3/
    rm xp_dedicated.bat xp_server.bat xp_singleplayer.bat
    rm -r excessiveplus/tools/
}
