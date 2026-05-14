pkgname=gvm-bin
pkgver=1.0.0
pkgrel=2
pkgdesc='Gradle version manager'
arch=('x86_64' 'aarch64')
url='https://github.com/crowforkotlin/gradle-version-manager'
license=('MIT')
provides=('gvm')
conflicts=('gvm')
source_x86_64=("gvm-1.0.0-linux-x86_64.tar.gz::https://github.com/crowforkotlin/gradle-version-manager/releases/download/release-1.0.0/gvm-1.0.0-linux-x86_64.tar.gz")
sha256sums_x86_64=('dc9ee73516b290934f4929d409640a2dd46590dde1aff8b7cebd32600ee0437c')
source_aarch64=("gvm-1.0.0-linux-aarch64.tar.gz::https://github.com/crowforkotlin/gradle-version-manager/releases/download/release-1.0.0/gvm-1.0.0-linux-aarch64.tar.gz")
sha256sums_aarch64=('447a05bb69a471e3c9a53a2e998950e0f036683daaf236e09d1357ca8ed6bdad')

package() {
  archive_dir="gvm-1.0.0-linux-${CARCH}"
  install -Dm755 "${srcdir}/${archive_dir}/gvm" "${pkgdir}/usr/bin/gvm"
  install -Dm755 "${srcdir}/${archive_dir}/install.sh" "${pkgdir}/usr/share/doc/${pkgname}/install.sh"
  install -Dm644 "${srcdir}/${archive_dir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${archive_dir}/README_ZH.md" "${pkgdir}/usr/share/doc/${pkgname}/README_ZH.md"
}
