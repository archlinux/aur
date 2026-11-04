# Maintainer: auscaster <hi@auscaster.com>
pkgname=nitromta-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Self-hosted mail delivery engine that speaks the Amazon SES v2 API"
arch=('x86_64' 'aarch64')
url="https://nitromta.com"
license=('Apache-2.0')
depends=('glibc' 'ca-certificates')
provides=('nitromta')
conflicts=('nitromta')
source_x86_64=("https://github.com/nitrosend/nitromta/releases/download/v0.2.1/nitromta-0.2.1-x86_64-linux.tar.gz")
source_aarch64=("https://github.com/nitrosend/nitromta/releases/download/v0.2.1/nitromta-0.2.1-aarch64-linux.tar.gz")
sha256sums_x86_64=('e71ee6b84332aba6210f81ac9d8982ac394ab00d344da5146def7cddd4a27925')
sha256sums_aarch64=('304693698a880b7dd87563a19da7ecd3ec9cc56da94583b6baae04000461f678')

package() {
  cd "nitromta-${pkgver}-${CARCH}-linux"
  install -Dm755 nitromta "$pkgdir/usr/bin/nitromta"
  install -Dm644 nitromta.service "$pkgdir/usr/lib/systemd/system/nitromta.service"
  install -Dm644 nitromta.sysusers "$pkgdir/usr/lib/sysusers.d/nitromta.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
