# Maintainer: 王德宇 <kvtodev@outlook.com>
pkgname=youtrack-bin
pkgver=0.8.2
pkgrel=1
pkgdesc='A command-line interface for JetBrains YouTrack'
arch=('x86_64' 'aarch64')
url='https://github.com/JetBrains/youtrack-cli'
license=('Apache-2.0')
provides=('youtrack')
conflicts=('youtrack' 'youtrack-git')
options=('!lto')
source_x86_64=("youtrack-${pkgver}-linux-x86_64.tar.gz::${url}/releases/download/v${pkgver}/youtrack_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("youtrack-${pkgver}-linux-aarch64.tar.gz::${url}/releases/download/v${pkgver}/youtrack_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('5da5276a5ec8d838af6c53ce81864b42971a6aa4b96da5cd99f9f6325d79ae63')
sha256sums_aarch64=('f497010498e243aff837cd4b7344f9c1b01934110788d30a972b60adc98bb186')

check() {
  YOUTRACK_NO_UPDATE=1 ./youtrack --version | grep -Fq "youtrack ${pkgver}"
}

package() {
  install -Dm755 youtrack "${pkgdir}/usr/bin/youtrack"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
