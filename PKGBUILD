# Maintainer: JasonLandbridge
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/hadolint-bin

pkgname=hadolint-bin
pkgver=2.15.1 # renovate: datasource=github-releases depName=hadolint/hadolint versioning=semver-coerced
pkgrel=1
pkgdesc="Dockerfile linter, validate inline bash, written in Haskell"
arch=('x86_64' 'aarch64')
url="https://github.com/hadolint/hadolint"
license=('GPL-3.0-or-later')
provides=('hadolint')
conflicts=('hadolint')
options=('!strip')

source=("LICENSE::https://raw.githubusercontent.com/hadolint/hadolint/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/hadolint-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/hadolint-linux-arm64")
sha256sums=('589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')
sha256sums_x86_64=('c7187db94eeeeca956519a6af171adc31453941a1e777961f6e680f697c8c507')
sha256sums_aarch64=('f6198ef8090f404dbb771abfee086eb8c48ac177f30da7fd3510aca35b344b5d')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/hadolint"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
