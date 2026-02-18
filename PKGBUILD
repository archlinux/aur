# Maintainer: Adrian <adrian@mxlinux.org>

pkgname=arch-remaster
pkgver=26.02
pkgrel=1
pkgdesc="Tools for remastering Arch Linux live systems and updating live USB GRUB configs"
arch=('any')
url="https://github.com/AdrianTM/arch-remaster"
license=('GPL')
depends=('bash' 'coreutils' 'util-linux' 'grep' 'sed')
optdepends=(
    'squashfs-tools: for live-remaster'
)
source=("https://github.com/AdrianTM/arch-remaster/archive/refs/tags/26.02.tar.gz")
sha256sums=('1f2a15524bfb6c3335887bac0cb17e22003ed8aa4a932a1e6939d033b8d28921')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install scripts
    install -Dm755 live-remaster "$pkgdir/usr/bin/live-remaster"
    install -Dm755 update-cow-space "$pkgdir/usr/bin/update-cow-space"

    # Install man pages
    install -Dm644 live-remaster.1 "$pkgdir/usr/share/man/man1/live-remaster.1"
    install -Dm644 update-cow-space.1 "$pkgdir/usr/share/man/man1/update-cow-space.1"
}
