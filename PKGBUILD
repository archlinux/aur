# SPDX-License-Identifier: GPL-3.0-or-later
# Maintainer: Mohamed Hammad <Mohamed.Hammad@Steelbore.com>
#
# gitway-bin — installs the pre-built static musl binary from the GitHub
# Release page.  This is the recommended package for most users.
#
# To build from source instead, use the companion gitway-git AUR package.
#
# Project page: https://gitway.steelbore.com/

pkgname=gitway-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Pure-Rust SSH toolkit for Git: transport, keys, signing, agent"
arch=('x86_64')
url="https://github.com/steelbore/gitway"
license=('GPL-3.0-or-later')
provides=('gitway')
conflicts=('gitway' 'gitway-git')

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/steelbore/gitway/releases/download/v${pkgver}/gitway-v${pkgver}-linux-x86_64.tar.gz"
)
sha256sums=('b54e51c7d686cd45ff13989f04a8036882d4ec67d08998986e7f39804a4e9f3c')

package() {
  cd "${srcdir}"

  install -Dm755 gitway          "${pkgdir}/usr/bin/gitway"
  install -Dm755 gitway-keygen   "${pkgdir}/usr/bin/gitway-keygen"
  install -Dm755 gitway-add      "${pkgdir}/usr/bin/gitway-add"
  install -Dm644 README.md       "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
