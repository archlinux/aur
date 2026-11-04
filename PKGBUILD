# Maintainer: auscaster <hi@auscaster.com>
pkgname=nitromta-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Self-hosted mail delivery engine that speaks the Amazon SES v2 API"
arch=('x86_64' 'aarch64')
url="https://nitromta.com"
license=('Apache-2.0')
depends=('glibc')
provides=('nitromta')
conflicts=('nitromta')
source_x86_64=("https://github.com/nitrosend/nitromta/releases/download/v0.2.0/nitromta-0.2.0-x86_64-linux.tar.gz")
source_aarch64=("https://github.com/nitrosend/nitromta/releases/download/v0.2.0/nitromta-0.2.0-aarch64-linux.tar.gz")
sha256sums_x86_64=('4263591cd6f295296c7fb567c4cd95b80f3e915d0edecb82f451519cd463f390')
sha256sums_aarch64=('22f4bd7a118488eda2f6a394b95b7b0274ecdc13bcb672f2bb90f1f21fe4d459')

package() {
  cd "nitromta-${pkgver}-${CARCH}-linux"
  install -Dm755 nitromta "$pkgdir/usr/bin/nitromta"
  install -Dm644 nitromta.service "$pkgdir/usr/lib/systemd/system/nitromta.service"
  install -Dm644 nitromta.sysusers "$pkgdir/usr/lib/sysusers.d/nitromta.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
