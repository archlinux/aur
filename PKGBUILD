# Maintainer: Erik <kocierik@github>
pkgname=lazyansible-bin
pkgver=1.0.3
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
sha256sums_x86_64=('43a804d6ee82441ccdb7c4ef7fab2abcb06048381838649149fbaf66de0d6f06')
sha256sums_aarch64=('1ca3445481d5398246a3caf9749196ed86760cba23c39cae769a756baad49ccb')

package() {
  install -Dm755 lazyansible          "${pkgdir}/usr/bin/lazyansible"
  install -Dm644 README.md            "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE              "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 CHANGELOG.md        "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
