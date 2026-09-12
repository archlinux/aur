pkgname=gitcrawl-bin
_realver="0.9.6"
pkgver="0.9.6"
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

sha256sums_x86_64=('7c8ddc1270a7cc755288d5e031ca845f1f2af2a2fda806466bc84f6bd5316cb2')
sha256sums_aarch64=('c255a144db31c25a75f7951496154c0e842e3811705e6506c76a3d22da539873')

package() {
  cd "${srcdir}"

  install -Dm755 gitcrawl "${pkgdir}/usr/bin/gitcrawl"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
