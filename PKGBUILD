# Maintainer: Ronald Lokers <ronald@lokers.email>
#
# Template — 2026.8.2 and 218e42e2f72e448e42f6028782b90eaa795c7d76bcc4b3f141ee499c2307adf9 are filled in by .github/workflows/aur.yml
# on each release. Installs the prebuilt musl binary from the GitHub Release.
pkgname=sugarrush-bin
pkgver=2026.8.2
pkgrel=1
pkgdesc="A terminal UI for viewing Nightscout CGM (blood glucose) data"
arch=('x86_64')
url="https://github.com/ronaldlokers/sugarrush"
license=('MIT')
provides=('sugarrush')
conflicts=('sugarrush')
options=('!strip')
source=("sugarrush-${pkgver}.tar.xz::https://github.com/ronaldlokers/sugarrush/releases/download/v${pkgver}/sugarrush-x86_64-unknown-linux-musl.tar.xz")
sha256sums=('218e42e2f72e448e42f6028782b90eaa795c7d76bcc4b3f141ee499c2307adf9')

# cargo-dist archives wrap their files in a "<name>-<target>" directory.
_dir="sugarrush-x86_64-unknown-linux-musl"

package() {
  install -Dm755 "${_dir}/sugarrush" "${pkgdir}/usr/bin/sugarrush"
  install -Dm644 "${_dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
