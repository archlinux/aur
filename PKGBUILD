# Maintainer: Giuliano Schneider <gs93@gmx.net>
# Contributor: leniviy
pkgname=hybrid-video-ati-intel
pkgver=20130828
pkgrel=1
pkgdesc="ATI-Intel hybrid graphics configurer"
arch=('any')
license=('custom')
depends=('systemd' 'xf86-video-ati' 'xf86-video-intel')
url="https://wiki.archlinux.org/index.php/Hybrid_graphics#ATI_Dynamic_Switchable_Graphics"
source=('hybrid-video-ati-intel.conf.modules-load' 'hybrid-video-ati-intel.conf.tmpfiles')
md5sums=('c41d9d65d75017cdf4b0dd1b8400001c'
         '49e81b7c199b6fc34475e2193b10ef72')
sha512sums=('8221d1a184e3417401cdf1337a1b825b88ab2d30b5e0540f7b67398b455f7b07650c2966213e07b2cdd39f2e9ab324bb1e59fdfbd947642ac60e50b124dbd7a0'
            'ee09b69249e9fe5f72daeef5e9b02a5f78a42f98980e1fa1e905eca521b378e5578ed674f01098af0dcdb1fb74c55f86b1ff87418ad3cd86e87e93cc2b3418ef')

package() {
    cd "$srcdir"
    # load module
    install -d -m 755 "$pkgdir/etc/modules-load.d/"
    install -m 644 hybrid-video-ati-intel.conf.modules-load "$pkgdir/etc/modules-load.d/hybrid-video-ati-intel.conf"
    # disable card
    install -d -m 755 "$pkgdir/etc/tmpfiles.d/"
    install -m 644 hybrid-video-ati-intel.conf.tmpfiles "$pkgdir/etc/tmpfiles.d/hybrid-video-ati-intel.conf"
}
