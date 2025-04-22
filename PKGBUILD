# Maintainer: mfw78 <mfw78@nullis.xyz>

pkgname=devpod-cli-bin
pkgver=0.6.15
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
sha256sums=('6c5bd63326f92a45707604970d70f6a8cc2c5ffffe703e0903a0c3ded4c042ab')

package() {
  tar -xvf ${pkgname}-${pkgver}.tar.gz

  install -Dm755 "usr/bin/devpod-cli" "${pkgdir}/usr/bin/devpod-cli"
}
