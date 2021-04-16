# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-osp
pkgver=1.03a
pkgrel=3
pkgdesc="Orange Smoothie Productions (OSP) is a modification for Quake 3 that adds many client and server features while still being compatable with the stock game."
url="https://www.orangesmoothie.org/"
license=('custom')
arch=('any')
depends=('quake3')
makedepends=('unzip')
source=("https://osp.dget.cc/orangesmoothie/downloads/osp-Quake3-${pkgver}_full.zip")
sha512sums=('9a9bc76ca2e582432e0f8ff6a3fe0bd2e0b0767a1f52bdea8debc7bc9053dc78951335da085b88e0f3690f1f7fda25a628cff9bace7f683f543c5eff90307e19')
noextract=("osp-Quake3-${pkgver}_full.zip")

package() {
    cd "${srcdir}";

    install -d "${pkgdir}/opt/quake3/";

    # Extract base OSP files
    unzip osp-Quake3-1.03a_full.zip -d "${pkgdir}/opt/quake3/"

    # Correct directory and file permissions
    find "${pkgdir}/opt/quake3/" \! -perm 644 -type f -exec chmod -v 644 {} \;
    find "${pkgdir}/opt/quake3/" \! -perm 755 -type d -exec chmod -v 755 {} \;
}
