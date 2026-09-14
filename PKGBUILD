pkgname=gitcrawl-bin
_realver="0.10.0"
pkgver="0.10.0"
pkgrel=1
pkgdesc='Local-first GitHub issue and pull request crawler for maintainer triage'
arch=('x86_64' 'aarch64')
url='https://github.com/openclaw/gitcrawl'
license=('MIT')
provides=('gitcrawl')
conflicts=('gitcrawl')

# GOOS_GOARCH triples: linux_amd64 (x86_64), linux_arm64 (aarch64)
# source_* and sha256sums_* auto-updated by publish.yml

source_x86_64=("gitcrawl-${_realver}-linux_amd64.tar.gz::https://github.com/openclaw/gitcrawl/releases/download/v${_realver}/gitcrawl_${_realver}_linux_amd64.tar.gz")
source_aarch64=("gitcrawl-${_realver}-linux_arm64.tar.gz::https://github.com/openclaw/gitcrawl/releases/download/v${_realver}/gitcrawl_${_realver}_linux_arm64.tar.gz")

sha256sums_x86_64=('c2e9bf74ab3606810591869ec16762fb6475792a676e89ab5ea893b83754ab77')
sha256sums_aarch64=('7fbb8f116dcc1066580233059168c513d324a9b6b11bc19834b3afc7de0abfed')

package() {
  cd "${srcdir}"

  install -Dm755 gitcrawl "${pkgdir}/usr/bin/gitcrawl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
