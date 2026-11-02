# Maintainer: auscaster <hi@auscaster.com>
pkgname=nitromta-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Self-hosted mail delivery engine that speaks the Amazon SES v2 API"
arch=('x86_64' 'aarch64')
url="https://nitromta.com"
license=('Apache-2.0')
depends=('glibc')
provides=('nitromta')
conflicts=('nitromta')
source_x86_64=("https://github.com/nitrosend/nitromta/releases/download/v0.1.4/nitromta-0.1.4-x86_64-linux.tar.gz")
source_aarch64=("https://github.com/nitrosend/nitromta/releases/download/v0.1.4/nitromta-0.1.4-aarch64-linux.tar.gz")
sha256sums_x86_64=('d72947f0147639585c255f00caccca9b9f69419d962d3d92915d62f2ed4880ae')
sha256sums_aarch64=('f11175d439391395a978d222fcb64cb7d3cc616c6f7823c2f817e61c179a5310')

package() {
  cd "nitromta-${pkgver}-${CARCH}-linux"
  install -Dm755 nitromta "$pkgdir/usr/bin/nitromta"
  install -Dm644 nitromta.service "$pkgdir/usr/lib/systemd/system/nitromta.service"
  install -Dm644 nitromta.sysusers "$pkgdir/usr/lib/sysusers.d/nitromta.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
