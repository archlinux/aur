# Maintainer: envolution
# Contributor: Mathias Buhr <napcode@aparatus.de>
# Based on waveforum-bundle aur package from Paul B Davis <paul@dangersalad.com>
# Based on tracktion-7 aur package from Felipe F. Tonello <eu@felipetonello.com>
# Based on tracktion-6 aur package from boltbuckle <amygdala@cheerful.com>

pkgname=tracktion-download-manager
pkgver=1.5.3
pkgrel=1
pkgdesc="Download manager for Tracktion applications"
arch=('x86_64')
url="https://www.tracktion.com/"
license=('LicenseRef-custom')
depends=(
  alsa-lib
  gcc-libs
  freetype2
  glibc
)

source=("https://downloads.tracktion.com/download-mgr/${pkgver//./}/tracktion_download_manager_v${pkgver}.deb")
sha256sums=('577b8480c9d33a8b5cc213c61e9c3ff90a6e6a0a00efa0cbe7f4c2ec4f99cfa7')

package() {
    tar -x --xz -f data.tar.xz -C "${pkgdir}"
    install -Dm644 $pkgdir/usr/share/doc/tracktion-download-manager/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
