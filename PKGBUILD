# Maintainer: auscaster <hi@auscaster.com>
pkgname=nitromta-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Self-hosted mail delivery engine that speaks the Amazon SES v2 API"
arch=('x86_64' 'aarch64')
url="https://nitromta.com"
license=('Apache-2.0')
depends=('glibc')
provides=('nitromta')
conflicts=('nitromta')
source_x86_64=("https://github.com/nitrosend/nitromta/releases/download/v0.1.6/nitromta-0.1.6-x86_64-linux.tar.gz")
source_aarch64=("https://github.com/nitrosend/nitromta/releases/download/v0.1.6/nitromta-0.1.6-aarch64-linux.tar.gz")
sha256sums_x86_64=('fe77b3099badd749d185e211c7978654e26da077b69b9eba6fea72aa4b976966')
sha256sums_aarch64=('88ee2a22a25561fcbddc857bfc9dae4deabbf261b5171b246c15a647cf921bdc')

package() {
  cd "nitromta-${pkgver}-${CARCH}-linux"
  install -Dm755 nitromta "$pkgdir/usr/bin/nitromta"
  install -Dm644 nitromta.service "$pkgdir/usr/lib/systemd/system/nitromta.service"
  install -Dm644 nitromta.sysusers "$pkgdir/usr/lib/sysusers.d/nitromta.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
