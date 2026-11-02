# Maintainer: auscaster <hi@auscaster.com>
pkgname=nitromta-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Self-hosted mail delivery engine that speaks the Amazon SES v2 API"
arch=('x86_64' 'aarch64')
url="https://nitromta.com"
license=('Apache-2.0')
depends=('glibc')
provides=('nitromta')
conflicts=('nitromta')
source_x86_64=("https://github.com/nitrosend/nitromta/releases/download/v0.1.5/nitromta-0.1.5-x86_64-linux.tar.gz")
source_aarch64=("https://github.com/nitrosend/nitromta/releases/download/v0.1.5/nitromta-0.1.5-aarch64-linux.tar.gz")
sha256sums_x86_64=('e59f8c139aedf9bb501ccd594c230b4316d7568431dfbde290c90de6e9f34441')
sha256sums_aarch64=('c7e2fd1487977345a0d7219beb2cb7e7f3fbd410878e14d91a2900cd53e1178b')

package() {
  cd "nitromta-${pkgver}-${CARCH}-linux"
  install -Dm755 nitromta "$pkgdir/usr/bin/nitromta"
  install -Dm644 nitromta.service "$pkgdir/usr/lib/systemd/system/nitromta.service"
  install -Dm644 nitromta.sysusers "$pkgdir/usr/lib/sysusers.d/nitromta.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
