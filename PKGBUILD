# Maintainer: mfw78 <mfw78@nullis.xyz>

pkgname=devpod-cli-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Codespaces but open-source, client-only, and unopinionated - unofficial package"
arch=('x86_64')
url="https://github.com/loft-sh/devpod"
license=('MPL-2.0')
provides=('devpod-cli')
depends=(
  'glib2'
  'gcc-libs'
  'glibc'
)
conflicts=('devpod' 'devpod-bin')
options=('!strip')
source=(
  "$pkgname-${pkgver}.tar.gz::https://github.com/loft-sh/devpod/releases/download/v${pkgver}/DevPod_linux_x86_64.tar.gz"
)
sha256sums=('61bf80aba6dc346796fd8227e7aefd9ccb80311be5b62689f2d941fabf8c5954')

package() {
  tar -xvf ${pkgname}-${pkgver}.tar.gz

  install -Dm755 "usr/bin/devpod-cli" "${pkgdir}/usr/bin/devpod-cli"
}
