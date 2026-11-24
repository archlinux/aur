# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=localix-cli-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="Agent runtime for coding and CI"
arch=('x86_64' 'aarch64')
url="https://github.com/localixai/localix-cli"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/llx-cli-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/llx-cli-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9da278cac696a053306d746d416863215a98ce906edc52156827e6c15b81a98a')
sha256sums_aarch64=('5018ea75fea9617996166f481613b0451ca74b63ee1df1d635d99ed8e1541969')

package() {
  install -Dm755 "llx" "${pkgdir}/usr/bin/llx"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
