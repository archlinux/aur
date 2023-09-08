# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=2.25.0
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
sha256sums_x86_64=('2abb4ccd487b1e6da15f5e7fdbbb2b5b9ec5b01f704c18becefa4ef5dfb100b5')
sha256sums_aarch64=('c0c30aca5a5b79e6939cc506925df4a744bc6536f2b6eba958fb338ea8cd3688')
sha256sums_armv7h=('dcc34aa322ae9fede481daacbf26cda54f6bf5185d079c3fa5849fa4d335f999')

package() {
  local x86_64=amd64 aarch64=arm64 armv7h=armv7

  mv "${srcdir}/aws-nuke-v${pkgver}-linux-${!CARCH}" "${srcdir}/aws-nuke"

  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
