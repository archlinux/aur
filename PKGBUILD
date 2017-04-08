# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-excessiveplus
pkgver=2.3
pkgrel=1
pkgdesc="Excessive Plus is a modification for Quake 3 where all weapons are 'excessive'."
url="http://www.excessiveplus.net/"
arch=('any')
license=('custom')
depends=('quake3')
source=("http://www.excessiveplus.net/files/release/xp-${pkgver}.zip")
sha256sums=('213adbd718be00c49a6cdc539b0372f99703042d7afa3a6c31740a3bc7e06820')
noextract=("xp-${pkgver}.zip")

package() {
    cd "${srcdir}"

    # Base Excessive Plus Files
    install -d "${pkgdir}/opt/quake3/"
    unzip "xp-${pkgver}.zip" -d "${pkgdir}/opt/quake3/"

    # Cleanup unneeded files
    cd "${pkgdir}/opt/quake3/"
    rm xp_dedicated.bat xp_server.bat xp_singleplayer.bat
    rm -r excessiveplus/tools/
}
