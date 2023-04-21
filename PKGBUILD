# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=2.22.1
pkgrel=1
arch=('x86_64' 'aarch64' 'armv7h')
url=https://github.com/rebuy-de/aws-nuke
license=('MIT')
provides=('aws-nuke')
conflicts=('aws-nuke')
_src="${url}/releases/download/v${pkgver}/aws-nuke-v${pkgver}-linux"
source_x86_64=("$_src"-amd64.tar.gz)
source_aarch64=("$_src"-arm64.tar.gz)
source_armv7h=("$_src"-arm7.tar.gz)
sha256sums_x86_64=('493ae8ad28b60b1753b867aecab0f206754a8ea93641fd1da9bbd99713b357bf')
sha256sums_aarch64=('cbc7d8a0255f9e15942eab03b950a43afa20558b4bbb037adff3634b5d402cf2')
sha256sums_armv7h=('e7f4b758bd53e65e692a426f8aa9d71358f3aa337a6aa5bea21be3e60a996aa7')

package() {
  local x86_64=amd64 aarch64=arm64 armv7h=armv7

  mv "${srcdir}/aws-nuke-v${pkgver}-linux-${!CARCH}" "${srcdir}/aws-nuke"

  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
