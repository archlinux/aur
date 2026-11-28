# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gitbackup-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Back up Bitbucket, GitHub, GitLab and Forgejo repositories"
arch=('x86_64' 'aarch64')
url="https://github.com/amitsaha/gitbackup"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gitbackup_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gitbackup_Linux_arm64.tar.gz")
sha256sums_x86_64=('3a7727d21d081e05c9f7c6babcc23edac455dfd9371d0b7c7783aae6346db91a')
sha256sums_aarch64=('d5467455b02dd4a39981a759deb216a7361db52dc311d068fd0e519f96d54c93')

package() {
  install -Dm755 "gitbackup" "${pkgdir}/usr/bin/gitbackup"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
