# Maintainer: Fhilipe Coelho <fhilipecoelho.dev@gmail.com>

pkgname=hydra-launcher
_pkgname=hydra-launcher
pkgver=1.1.0
pkgrel=2
pkgdesc="No bullshit, just play"
arch=('x86_64')
url="https://github.com/hydralauncher/hydra"
license=('MIT')
provides=('hydra-launcher')

source=()

source_x86_64=("https://github.com/hydralauncher/hydra/releases/download/v${pkgver}/hydra-launcher_${pkgver}_amd64.deb")
sha256sums_x86_64=('66ef041728020388b84ddf10e34207377d370101e2244e613fac1bbb65e0272c')

package() {
  cd ${srcdir}

  tar -xf data.tar.zst -C ${pkgdir} --exclude='./control'
  chmod go-w "${pkgdir}"/usr "${pkgdir}"/usr/bin
  chmod -R go-w "${pkgdir}"/usr/share
}

