# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=gitlab-ci-linter-bin
pkgver=2.4.0
pkgrel=1
pkgdesc='Tool for validating .gitlab-ci.yml using Gitlab API'
url='https://gitlab.com/orobardet/gitlab-ci-linter'
arch=('aarch64' 'x86_64' 'armv7h')
license=('MIT')
conflicts=("${pkgname%-bin}")

source=("LICENSE_$pkgver::$url/raw/v$pkgver/LICENSE")
source_x86_64=("${pkgname}_${pkgver}_linux_x86_64::$url/-/releases/v${pkgver}/downloads/${pkgname%-bin}_${pkgver}_linux_amd64")
source_aarch64=("${pkgname}_${pkgver}_linux_aarch64::$url/-/releases/v${pkgver}/downloads/${pkgname%-bin}_${pkgver}_linux_arm64")
source_armv7h=("${pkgname}_${pkgver}_linux_armv7h::$url/-/releases/v${pkgver}/downloads/${pkgname%-bin}_${pkgver}_linux_armv6")

sha256sums=('850407045fb0253200255888dc5ff1e953c6a265ebb6f35ec900ca4d5acd519f')
sha256sums_aarch64=('058f5797f4bccfdfeab73bc99a0459bf11d2c2de050c2fca18537d7877833aa3')
sha256sums_x86_64=('b907b0c9e894a1df9fededc903dbce813f9a9ef26ff13505443046d6c56b575d')
sha256sums_armv7h=('0b1a239b2778268650ba77aa00a00cc84d5d76ec65e3d7cec867f9d322c746a8')

package() {
  install -Dm755 "${pkgname}_${pkgver}_linux_${CARCH}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "LICENSE_$pkgver" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
