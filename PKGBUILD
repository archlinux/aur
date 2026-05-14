pkgname=gvm-bin
pkgver=1.0.0
pkgrel=3
pkgdesc='Gradle version manager'
arch=('x86_64' 'aarch64')
url='https://github.com/crowforkotlin/gradle-version-manager'
license=('MIT')
provides=('gvm')
conflicts=('gvm')
source_x86_64=("gvm-1.0.0-linux-x86_64.tar.gz::https://github.com/crowforkotlin/gradle-version-manager/releases/download/release-1.0.0/gvm-1.0.0-linux-x86_64.tar.gz")
sha256sums_x86_64=('633feb80b941bd5fc58ae006c22141c42d301a6c6f4d3c0b3cb59e9ef1188191')
source_aarch64=("gvm-1.0.0-linux-aarch64.tar.gz::https://github.com/crowforkotlin/gradle-version-manager/releases/download/release-1.0.0/gvm-1.0.0-linux-aarch64.tar.gz")
sha256sums_aarch64=('3d6300d29bca418afd5a00e092e35ef27f83882dcaecb6f8b22df18953cabea7')

package() {
  archive_dir="gvm-1.0.0-linux-${CARCH}"
  install -Dm755 "${srcdir}/${archive_dir}/gvm" "${pkgdir}/usr/bin/gvm"
  install -Dm755 "${srcdir}/${archive_dir}/install.sh" "${pkgdir}/usr/share/doc/${pkgname}/install.sh"
  install -Dm644 "${srcdir}/${archive_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${archive_dir}/README_ZH.md" "${pkgdir}/usr/share/doc/${pkgname}/README_ZH.md"
}
