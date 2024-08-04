# Maintainer: vinfehring <vinfehring at gmail dot com>
# Contributor: Fhilipe Coelho <fhilipecoelho.dev@gmail.com>

pkgname=hydra-launcher-bin
_pkgname=hydra-launcher
pkgver=2.0.3
pkgrel=1
pkgdesc="A game launcher with its own embedded bittorrent client and a self-managed repack scraper."
arch=('x86_64')
url="https://github.com/hydralauncher/hydra"
license=('MIT')
provides=('hydra-launcher')
options=(debug !strip)
depends=('lutris')

source=()

source_x86_64=("https://github.com/hydralauncher/hydra/releases/download/v${pkgver}/hydralauncher_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')

package() {
  tar -xvf 'data.tar.xz' -C "${pkgdir}"
  install -dv "${pkgdir}/usr/bin"
  ln -sfv "/opt/Hydra/hydralauncher" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgdir}/opt/Hydra/"LICENSES.chromium.html \
    -t "${pkgdir}/usr/share/licenses/hydra-launcher"
}

