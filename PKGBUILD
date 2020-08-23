# Maintainer: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=cni-plugins-bin
pkgver=0.8.6
pkgrel=1
pkgdesc="Some CNI network plugins, maintained by the containernetworking team"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/containernetworking/plugins"
license=('Apache')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('7da624010bd2b9fcf47bc30076861166f31ab5936f3b36f199714c7d276a0d12');;
  aarch64) _CARCH=arm64 && sha256sums=('43fbf750c5eccb10accffeeb092693c32b236fb25d919cf058c91a677822c999');;
  armv7h)  _CARCH=arm && sha256sums=('28e61b5847265135dc1ca397bf94322ecce4acab5c79cc7d360ca3f6a655bdb7');;
esac

source=("https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-linux-${_CARCH}-v${pkgver}.tgz")

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/opt/cni/bin
  install -Dm755 * "$pkgdir"/opt/cni/bin
  rm "$pkgdir"/opt/cni/bin/cni-plugins-linux-${_CARCH}-v${pkgver}.tgz
}

sha256sums=('994fbfcdbb2eedcfa87e48d8edb9bb365f4e2747a7e47658482556c12fd9b2f5')
