# Maintainer: Max <max@swk-web.com>
pkgname=devin-cli-bin
pkgver=3000.11.1
pkgrel=1
pkgdesc="Command-line interface for Devin, Cognition's AI software engineer"
arch=('x86_64' 'aarch64')
url="https://cli.devin.ai"
license=('custom')
provides=('devin-cli')
conflicts=('devin-cli')
options=('!strip' '!debug')

source_x86_64=("https://static.devin.ai/cli/${pkgver}/devin-${pkgver}-x86_64-unknown-linux.tar.gz")
sha256sums_x86_64=('4387fec13bf1c42b2dd9d677b16b3ef8dc4709fa6ec24b377eef6c1232fa8adb')

source_aarch64=("https://static.devin.ai/cli/${pkgver}/devin-${pkgver}-aarch64-unknown-linux.tar.gz")
sha256sums_aarch64=('92f19cddca5f5b150c29b039df2bcb22d3b35391fde3ca1144f0c86171c8fd87')

package() {
  install -Dm755 "${srcdir}/bin/devin" "${pkgdir}/usr/bin/devin"

  if [ -d "${srcdir}/share/man/man1" ]; then
    install -d "${pkgdir}/usr/share/man/man1"
    install -m644 "${srcdir}"/share/man/man1/*.1 "${pkgdir}/usr/share/man/man1/"
  fi
}
