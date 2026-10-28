# Maintainer: Twilight0 <https://github.com/Twilight0>
pkgname=nouveau-utils
pkgver=2.2.3
pkgrel=2
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
sha256sums=('71b22e4337d63f76ccf16c587d1111b2a7352641887e187107daa17bfc6109d5')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" PREFIX="/usr"
}
