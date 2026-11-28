# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=copywrite-bin
pkgver=0.25.3
pkgrel=1
pkgdesc="Automate copyright headers and license files at scale"
arch=('x86_64' 'aarch64')
url="https://github.com/hashicorp/copywrite"
license=('MPL-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/copywrite_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/copywrite_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('e43f4b72fff3f219c5a5f883438d63edd5b68f5bea90a5d18abb3001c8c3aedc')
sha256sums_aarch64=('e1eb389e4afdb29693e0cf5984d07395a3940f55678bb705e5e1d34f699c158c')

package() {
  install -Dm755 "copywrite" "${pkgdir}/usr/bin/copywrite"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "licensecheck/licensecheck.go" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "licensecheck/licensecheck_test.go" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "licensecheck/licensetext.go" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
