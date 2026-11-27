# Maintainer: Twilight0 <https://github.com/Twilight0>
pkgname=nouveau-utils
pkgver=2.3.1
pkgrel=1
pkgdesc="Userspace dynamic frequency governor, CLI management tool, and interactive TUI for Nouveau"
arch=('any')
url="https://github.com/Twilight0/nouveau-utils"
license=('GPL-2.0-only')
depends=('python')
optdepends=(
  'nouveau-dkms: out-of-tree dynamic reclocking DKMS module'
  'nouveau-cachyos-lts-v2: prebuilt reclocking module for linux-cachyos-lts-v2'
)
provides=('nouveau-utils')
backup=('etc/nouveau-dynclockd.conf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Twilight0/nouveau-utils/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0ec4556dd516469a21c27d55dd733f6bc2eca1e25de530e22215a40028ec733f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
