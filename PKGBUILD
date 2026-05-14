pkgname=gvm-bin
pkgver=1.0.0
pkgrel=4
pkgdesc='Gradle version manager'
arch=('x86_64' 'aarch64')
url='https://github.com/crowforkotlin/gradle-version-manager'
license=('MIT')
provides=('gvm')
conflicts=('gvm')
source_x86_64=("gvm-1.0.0-linux-x86_64.tar.gz::https://github.com/crowforkotlin/gradle-version-manager/releases/download/release-1.0.0/gvm-1.0.0-linux-x86_64.tar.gz")
sha256sums_x86_64=('a841704f8abb5e4ab58944f2c536af2aa18e4da2efa8644774468050049b75f8')
source_aarch64=("gvm-1.0.0-linux-aarch64.tar.gz::https://github.com/crowforkotlin/gradle-version-manager/releases/download/release-1.0.0/gvm-1.0.0-linux-aarch64.tar.gz")
sha256sums_aarch64=('a9bc7f11dc932795a477f2864b0dbe0b8274670e7b11822c889ab34c1df68e5e')

package() {
  archive_dir="gvm-1.0.0-linux-${CARCH}"
  install -Dm755 "${srcdir}/${archive_dir}/gvm" "${pkgdir}/usr/bin/gvm"
  install -Dm755 "${srcdir}/${archive_dir}/install.sh" "${pkgdir}/usr/share/doc/${pkgname}/install.sh"
  install -Dm644 "${srcdir}/${archive_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${archive_dir}/README_ZH.md" "${pkgdir}/usr/share/doc/${pkgname}/README_ZH.md"
}
