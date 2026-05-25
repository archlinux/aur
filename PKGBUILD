# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: Mohamed Hammad <Mohamed.Hammad@SpacecraftSoftware.org>
#
# gitway-bin — installs the pre-built static musl binary from the GitHub
# Release page.  This is the recommended package for most users.
#
# To build from source instead, use the companion gitway-git AUR package.
#
# Project page: https://SpacecraftSoftware.org/gitway/

pkgname=gitway-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Pure-Rust SSH toolkit for Git: transport, keys, signing, agent"
arch=('x86_64')
url="https://github.com/Spacecraft-Software/Gitway"
license=('GPL-3.0-or-later')
provides=('gitway')
conflicts=('gitway' 'gitway-git')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/Spacecraft-Software/Gitway/releases/download/v${pkgver}/gitway-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('ccc78b6e0c74d37b386f3b618bb85ce26ff322b83ba39a61a6c2d80094755724')

package() {
  cd "${srcdir}"

  install -Dm755 gitway          "${pkgdir}/usr/bin/gitway"
  install -Dm755 gitway-keygen   "${pkgdir}/usr/bin/gitway-keygen"
  install -Dm755 gitway-add      "${pkgdir}/usr/bin/gitway-add"
  install -Dm644 README.md       "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
