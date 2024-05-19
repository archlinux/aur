# Maintainer: Fhilipe Coelho <fhilipecoelho.dev@gmail.com>

pkgname=hydra-launcher-bin
_pkgname=hydra-launcher
pkgver=1.2.2
pkgrel=2
pkgdesc="A game launcher with its own embedded bittorrent client and a self-managed repack scraper."
arch=('x86_64')
url="https://github.com/hydralauncher/hydra"
license=('MIT')
provides=('hydra-launcher')
options=(debug !strip)
depends=('lutris')

source=()

source_x86_64=("https://github.com/hydralauncher/hydra/releases/download/v${pkgver}/hydra_${pkgver}_amd64.deb")
sha256sums_x86_64=('54cccb6aa73f3729340ec18ec411884eb375fa0590e0e146697037120151aba0')

package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  install -dv "${pkgdir}/usr/bin"
  ln -sfv "/opt/Hydra/hydra" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgdir}/opt/Hydra/"LICENSES.chromium.html \
    -t "${pkgdir}/usr/share/licenses/hydra-launcher"
}

