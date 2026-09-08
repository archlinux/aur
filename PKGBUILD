pkgname=gitcrawl-bin
_realver="0.9.4"
pkgver="0.9.4"
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

sha256sums_x86_64=('4e5b8593ef95b2f2d2e7d3998dd7308e8768c730f1faa8cf37833964b3a356c2')
sha256sums_aarch64=('242ab8e06836d0a9ed541fec4e24b30276b9ff3a3824b6482b3a0b83f3bcf08b')

package() {
  cd "${srcdir}"

  install -Dm755 gitcrawl "${pkgdir}/usr/bin/gitcrawl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
