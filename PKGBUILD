# Maintainer: Erik <kocierik@github>
pkgname=lazyansible-bin
pkgver=X.Y.Z
pkgrel=1
pkgdesc="A lazy TUI for Ansible — browse inventory, run playbooks, stream logs"
arch=('x86_64' 'aarch64')
url="https://github.com/kocierik/lazyansible"
license=('MIT')
provides=('lazyansible')
conflicts=('lazyansible' 'lazyansible-git')
options=(!strip)

source_x86_64=(
  "${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/kocierik/lazyansible/releases/download/v${pkgver}/lazyansible_${pkgver}_linux_x86_64.tar.gz"
)
source_aarch64=(
  "${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/kocierik/lazyansible/releases/download/v${pkgver}/lazyansible_${pkgver}_linux_arm64.tar.gz"
)

# Run `updpkgsums` after each release to refresh these.
sha256sums_x86_64=('a03dd5678ff4681fc46ec86a24c8ab81b7a181e16b917323b114112bac29b6c4')
sha256sums_aarch64=('c50385ef768f272b0c84523b13c754517861bd3287de3ed52e647eda0d11c02c')

package() {
  install -Dm755 lazyansible          "${pkgdir}/usr/bin/lazyansible"
  install -Dm644 README.md            "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE              "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 CHANGELOG.md        "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
