pkgname=gvm-bin
pkgver=1.0.0
pkgrel=6
pkgdesc='Gradle version manager'
arch=('x86_64' 'aarch64')
url='https://github.com/crowforkotlin/gradle-version-manager'
license=('MIT')
provides=('gvm')
conflicts=('gvm')
source_x86_64=("gvm-1.0.0-linux-x86_64.tar.gz::https://github.com/crowforkotlin/gradle-version-manager/releases/download/release-1.0.0/gvm-1.0.0-linux-x86_64.tar.gz")
sha256sums_x86_64=('947055bba8b70855b0bf509f4b6dd0dd8ca11411df47b8d659823c1fa953ce4b')
source_aarch64=("gvm-1.0.0-linux-aarch64.tar.gz::https://github.com/crowforkotlin/gradle-version-manager/releases/download/release-1.0.0/gvm-1.0.0-linux-aarch64.tar.gz")
sha256sums_aarch64=('28db13a18969a8b27f1d67bf7c58dc47779501a474c1cb1345f8133ff0a03cdb')

package() {
  archive_dir="gvm-1.0.0-linux-${CARCH}"
  install -Dm755 "${srcdir}/${archive_dir}/gvm" "${pkgdir}/usr/bin/gvm"
  install -Dm755 "${srcdir}/${archive_dir}/install.sh" "${pkgdir}/usr/share/doc/${pkgname}/install.sh"
  install -Dm644 "${srcdir}/${archive_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${archive_dir}/README_ZH.md" "${pkgdir}/usr/share/doc/${pkgname}/README_ZH.md"
}
