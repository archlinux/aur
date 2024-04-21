# Maintainer: Fhilipe Coelho <fhilipecoelho.dev@gmail.com>

pkgname=hydra-launcher
_pkgname=hydra-launcher
pkgver=1.1.0
pkgrel=3
pkgdesc="No bullshit, just play"
arch=('x86_64')
url="https://github.com/hydralauncher/hydra"
license=('MIT')
provides=('hydra-launcher')
options=(debug !strip)

source=()

source_x86_64=("https://github.com/hydralauncher/hydra/releases/download/v${pkgver}/hydra-launcher_${pkgver}_amd64.deb")
sha256sums_x86_64=('66ef041728020388b84ddf10e34207377d370101e2244e613fac1bbb65e0272c')

package() {
  tar -xvf 'data.tar.zst' -C "${pkgdir}"
  install -dv "${pkgdir}/usr/bin"
  ln -sfv "/usr/lib/hydra-launcher/Hydra" -t "${pkgdir}/usr/bin"
  install -Dvm644 "${pkgdir}/usr/lib/hydra-launcher/"LICENSES.chromium.html \
    -t "${pkgdir}/usr/share/licenses/hydra-launcher"
}

