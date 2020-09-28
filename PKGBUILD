# Maintainer: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=cni-plugins-bin
pkgver=0.8.7
pkgrel=1
pkgdesc="Some CNI network plugins, maintained by the containernetworking team"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/containernetworking/plugins"
license=('Apache')

case "${CARCH}" in
  x86_64)  _CARCH=amd64 && sha256sums=('7da624010bd2b9fcf47bc30076861166f31ab5936f3b36f199714c7d276a0d12');;
  aarch64) _CARCH=arm64 && sha256sums=('ae13d7b5c05bd180ea9b5b68f44bdaa7bfb41034a2ef1d68fd8e1259797d642f');;
  armv7h)  _CARCH=arm && sha256sums=('5757778f4c322ffd93d7586c60037b81a2eb79271af6f4edf9ff62b4f7868ed9');;
esac

source=("https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-linux-${_CARCH}-v${pkgver}.tgz")

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/opt/cni/bin
  install -Dm755 * "$pkgdir"/opt/cni/bin
  rm "$pkgdir"/opt/cni/bin/cni-plugins-linux-${_CARCH}-v${pkgver}.tgz
}

sha256sums=('977824932d5667c7a37aa6a3cbba40100a6873e7bd97e83e8be837e3e7afd0a8')
