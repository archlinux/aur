# Maintainer: auscaster <hi@auscaster.com>
pkgname=nitromta-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Self-hosted mail delivery engine that speaks the Amazon SES v2 API"
arch=('x86_64' 'aarch64')
url="https://nitromta.com"
license=('Apache-2.0')
depends=('glibc' 'ca-certificates')
provides=('nitromta')
conflicts=('nitromta')
source_x86_64=("https://github.com/nitrosend/nitromta/releases/download/v0.3.0/nitromta-0.3.0-x86_64-linux.tar.gz")
source_aarch64=("https://github.com/nitrosend/nitromta/releases/download/v0.3.0/nitromta-0.3.0-aarch64-linux.tar.gz")
sha256sums_x86_64=('fc54ff72f5c7a6391ece7d105fa74dc7884300e7d9600a1fab1fc886b75cbb38')
sha256sums_aarch64=('609e787ecbf9c4f577cd03d17d5820b1bbafad03fe0c388543df3ff73192570e')

package() {
  cd "nitromta-${pkgver}-${CARCH}-linux"
  install -Dm755 nitromta "$pkgdir/usr/bin/nitromta"
  install -Dm644 nitromta.service "$pkgdir/usr/lib/systemd/system/nitromta.service"
  install -Dm644 nitromta.sysusers "$pkgdir/usr/lib/sysusers.d/nitromta.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
