# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=vega-protocol-bin
pkgver=0.74.7
_pkgver=0.74.7
pkgrel=1
pkgdesc="A Go implementation of the Vega Protocol, a protocol for creating and trading derivatives on a fully decentralised network."
arch=('x86_64' 'aarch64')
url="https://vega.xyz"
license=('AGPL-3.0-only')
depends=()
provides=('vega' 'vegavisor')
conflicts=('vega' 'vegavisor')

source_x86_64=(
  "https://github.com/vegaprotocol/vega/releases/download/v${_pkgver}/vega-linux-amd64.zip"
  "https://github.com/vegaprotocol/vega/releases/download/v${_pkgver}/visor-linux-amd64.zip"
)

source_aarch64=(
  "https://github.com/vegaprotocol/vega/releases/download/v${_pkgver}/vega-linux-arm64.zip"
  "https://github.com/vegaprotocol/vega/releases/download/v${_pkgver}/visor-linux-arm64.zip"
)

sha256sums_x86_64=('1bc678ca01499c7858f2b4700e1dbf28056d3a77f8a2258bdfef7b850334d598'
                   '795001b813d2bac0d28c8c1f9da6835473058bf21fe56ca7912b355a65da5db7')
sha256sums_aarch64=('a1e061c5ba52649e8ca760a16cdd906f0ec5075495dd725f5364d067f9debfa7'
                    'fdcd458f009af4d3f27b0374f24a95b295bac2538a4f10ba7e98ce51f5824013')

package() {
  install -Dm755 "${srcdir}/vega" "${pkgdir}/usr/bin/vega"
  install -Dm755 "${srcdir}/visor" "${pkgdir}/usr/bin/vegavisor"
}
