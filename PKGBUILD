# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=air-bin
pkgver=1.40.2
pkgrel=1
pkgdesc="Live reload for Go apps"
url="https://github.com/cosmtrek/${pkgname%-bin}"
arch=('x86_64' 'i686' 'aarch64')
license=(GPL3)
depends=(go)
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("${pkgname/-bin/}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${pkgname/-bin/}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${pkgname/-bin/}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname/-bin/}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('530bbb63d646325e951c267c54ad9716620f680e677e874aeadd1cec56013322')
sha256sums_i686=('dac47d159299aec6cef5a8df5f003570f2f3db032dd94eb36ad8d1b0694137a1')
sha256sums_aarch64=('7632ef665b7b75c07eb3f17ce0361a1ae3f01c6baba897d092fabc03d56e1684')

package() {
  install -Dvm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dvm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
  install -Dvm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}
