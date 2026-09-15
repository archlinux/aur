# Maintainer: Max <max@swk-web.com>
pkgname=devin-cli-bin
pkgver=3000.10.27
pkgrel=1
pkgdesc="Command-line interface for Devin, Cognition's AI software engineer"
arch=('x86_64' 'aarch64')
url="https://devin.ai"
license=('custom')
provides=('devin-cli')
conflicts=('devin-cli')
options=('!strip' '!debug')

source_x86_64=("https://static.devin.ai/cli/${pkgver}/devin-${pkgver}-x86_64-unknown-linux.tar.gz")
sha256sums_x86_64=('f6516dc32b8c2d6739931e6727759bd33e731b25d3806c2f37b8fb395c205099')

source_aarch64=("https://static.devin.ai/cli/${pkgver}/devin-${pkgver}-aarch64-unknown-linux.tar.gz")
sha256sums_aarch64=('c59c813723a91553041cd284ed68a655eef5c49ed046cbdd86905101832e160c')

package() {
  install -Dm755 "${srcdir}/bin/devin" "${pkgdir}/usr/bin/devin"

  if [ -d "${srcdir}/share/man/man1" ]; then
    install -d "${pkgdir}/usr/share/man/man1"
    install -m644 "${srcdir}"/share/man/man1/*.1 "${pkgdir}/usr/share/man/man1/"
  fi
}
