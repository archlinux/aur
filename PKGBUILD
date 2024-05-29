# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=vega-protocol-bin
pkgver=0.76.8
pkgrel=1
pkgdesc="A Go implementation of the Vega Protocol, a protocol for creating and trading derivatives on a fully decentralised network."
arch=('x86_64' 'aarch64')
url="https://vega.xyz"
license=('AGPL-3.0-only')
depends=()
provides=('vega' 'vegavisor')
conflicts=('vega' 'vegavisor')

source_x86_64=(
  "https://github.com/vegaprotocol/vega/releases/download/v${pkgver}/vega-linux-amd64.zip"
  "https://github.com/vegaprotocol/vega/releases/download/v${pkgver}/visor-linux-amd64.zip"
)

source_aarch64=(
  "https://github.com/vegaprotocol/vega/releases/download/v${pkgver}/vega-linux-arm64.zip"
  "https://github.com/vegaprotocol/vega/releases/download/v${pkgver}/visor-linux-arm64.zip"
)

sha256sums_x86_64=('f9a86bb6bf6c7ed245b590a08a27ab54313cef02132293d987d3f672fc2ffef9'
                   '0a62b46f1680554d3448e1b9d214aac2fbfc0b5f4e6b6aebb661a8cd40ad7c47')
sha256sums_aarch64=('af45bd464c51d01fe71679715e11b22d0b87d98d996da0b938d827a6fe96d640'
                    '31b56624689ec7c443681abc3e2582c8cffbe0fd0c1a7ee63bb4c1a4872e8c5e')
b2sums_x86_64=('6f70ac70af71b6ac7623dc6efba07170103ac49387069e69d426af9fea52d18bec858a141d5da4f255fae59f2c752ba5419c074d355c015971d58acb55360d9a'
               '2cd321bcdc6db6b6fc237df3b9047daa6f1981288905e8b5c6af9ff0052cecea93744c90a9f95fba2d46386eb80fdbd0ff17ca80c8e6e08dc1cf03de18ce3600')
b2sums_aarch64=('aedde49907dcf348f81775546772b63070c35e078a79474bcc03b464c7e8d07e6c52e82572557ec5150036a5696f37ef746bac0eaeea1f6b936709bbfe1118d5'
                '9eada847d1e04cadbe57ce834f0b51e991d500798a50d2ca98a150de3ff29a0fe732399ef22d2bf0ad032d4d51036f9471e76241f22ef506f9eb8cb238e97c22')

package() {
  install -Dm755 "${srcdir}/vega" "${pkgdir}/usr/bin/vega"
  install -Dm755 "${srcdir}/visor" "${pkgdir}/usr/bin/vegavisor"
}
