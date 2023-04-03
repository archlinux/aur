# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
pkgname=aws-nuke-bin
pkgdesc='Nuke a whole AWS account and delete all its resources.'
pkgver=2.22.0
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
sha256sums_x86_64=('50ba161fb36d2d725da0ca9223be2666bf4059093ea3ae7e0699545eceba84db')
sha256sums_aarch64=('f3ee2c6c2b427d992e2709196f5f499d56737e111eb921e91d62f8bbe51ed781')
sha256sums_armv7h=('0f5b59ee70de74da4189f1120016d448b5723a135e3a3c8411d7d9a05070da9a')

package() {
  local x86_64=amd64 aarch64=arm64 armv7h=armv7

  mv "${srcdir}/aws-nuke-v${pkgver}-linux-${!CARCH}" "${srcdir}/aws-nuke"

  install -Dm755 "${srcdir}/aws-nuke" -t "$pkgdir"/usr/bin
}
