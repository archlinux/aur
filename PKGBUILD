# Maintainer: Fhilipe Coelho <fhilipecoelho.dev@gmail.com>

pkgname=hydra-launcher
_pkgname=hydra-launcher
pkgver=1.1.0
pkgrel=1
pkgdesc="No bullshit, just play"
arch=('x86_64')
url="https://github.com/hydralauncher/hydra"
license=('MIT')
provides=('hydra-launcher')

source=()

source_x86_64=("https://github.com/hydralauncher/hydra/releases/download/v${pkgver}/hydra_${pkgver}_amd64.deb")
sha256sums_x86_64=('31a53ed03d48f59bdf31b1d56990c4cd1497fd38210bda357b455e0c13daf0aa')

package() {
  cd ${srcdir}

  tar -xf data.tar.zst -C ${pkgdir} --exclude='./control'
  chmod go-w "${pkgdir}"/usr "${pkgdir}"/usr/bin
  chmod -R go-w "${pkgdir}"/usr/share
}

