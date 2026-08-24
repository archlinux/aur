# Maintainer: Ronald Lokers <ronald@lokers.email>
#
# Template — 2026.8.3 and 8a26d07f39796fc57f54defe40a7febbda17ed0ddeb96e08d6cc8fa68da38de0 are filled in by .github/workflows/aur.yml
# on each release. Installs the prebuilt musl binary from the GitHub Release.
pkgname=sugarrush-bin
pkgver=2026.8.3
pkgrel=1
pkgdesc="A terminal UI for viewing Nightscout CGM (blood glucose) data"
arch=('x86_64')
url="https://github.com/ronaldlokers/sugarrush"
license=('MIT')
provides=('sugarrush')
conflicts=('sugarrush')
options=('!strip')
source=("sugarrush-${pkgver}.tar.xz::https://github.com/ronaldlokers/sugarrush/releases/download/v${pkgver}/sugarrush-x86_64-unknown-linux-musl.tar.xz")
sha256sums=('8a26d07f39796fc57f54defe40a7febbda17ed0ddeb96e08d6cc8fa68da38de0')

# cargo-dist archives wrap their files in a "<name>-<target>" directory.
_dir="sugarrush-x86_64-unknown-linux-musl"

package() {
  install -Dm755 "${_dir}/sugarrush" "${pkgdir}/usr/bin/sugarrush"
  install -Dm644 "${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
