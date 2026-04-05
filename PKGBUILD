# Maintainer: Erik <kocierik@github>
pkgname=lazyansible-bin
pkgver=1.0.4
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
sha256sums_x86_64=('e60433dd91d2cf42cdf2938de9e9b0908232e7f19c8e59f8ab39c1b0a03514fc')
sha256sums_aarch64=('3f16cbf0f63c2f13cf4b018d3f5e2f402715797107a4731d6560e8468e9726e8')

package() {
  install -Dm755 lazyansible          "${pkgdir}/usr/bin/lazyansible"
  install -Dm644 README.md            "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE              "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 CHANGELOG.md        "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
