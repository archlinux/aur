pkgname=cynix-lsb-release
pkgver=1.3
pkgrel=1
pkgdesc="Custom Cynix Linux distribution information"
arch=('any')
license=('MIT')
depends=('lsb-release')

package() {
    # Create directories
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/etc"

    # Copy script to package directory
    install -m755 cynix-lsb-release "${pkgdir}/usr/bin/"

    # Create custom lsb-release file
    echo "DISTRIB_ID=Cynix" > "${pkgdir}/etc/lsb-release"
    echo "DISTRIB_RELEASE=1.0" >> "${pkgdir}/etc/lsb-release"
    echo "DISTRIB_DESCRIPTION=\"Cynix Linux\"" >> "${pkgdir}/etc/lsb-release"
}

# Add metadata
source=("cynix-lsb-release")
sha256sums=('SKIP')
