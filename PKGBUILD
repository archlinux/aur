# Maintainer: Ronald Lokers <ronald@lokers.email>
#
# Template — 2026.7.3 and 48d3b3ba5fd46b9784570442cad834c65af681b69094c1f97bd09255966c7292 are filled in by .github/workflows/aur.yml
# on each release. Installs the prebuilt musl binary from the GitHub Release.
pkgname=sugarrush-bin
pkgver=2026.7.3
pkgrel=1
pkgdesc="A terminal UI for viewing Nightscout CGM (blood glucose) data"
arch=('x86_64')
url="https://github.com/ronaldlokers/sugarrush"
license=('MIT')
provides=('sugarrush')
conflicts=('sugarrush')
options=('!strip')
source=("sugarrush-${pkgver}.tar.xz::https://github.com/ronaldlokers/sugarrush/releases/download/v${pkgver}/sugarrush-x86_64-unknown-linux-musl.tar.xz")
sha256sums=('48d3b3ba5fd46b9784570442cad834c65af681b69094c1f97bd09255966c7292')

# cargo-dist archives wrap their files in a "<name>-<target>" directory.
_dir="sugarrush-x86_64-unknown-linux-musl"

package() {
  install -Dm755 "${_dir}/sugarrush" "${pkgdir}/usr/bin/sugarrush"
  install -Dm644 "${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
