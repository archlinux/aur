# Maintainer: Twilight0 <https://github.com/Twilight0>
pkgname=nouveau-utils
pkgver=2.2.5
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
sha256sums=('24cb1b38e9e1c9420a98e7c4843acbf8a56a9aeccf72d787b1e64c0894d1be4f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
