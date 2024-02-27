# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=vega-protocol-bin
pkgver=0.74.4
_pkgver=0.74.4
pkgrel=2
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

sha256sums_x86_64=('8195a09b954c8e1434516fad67a9043e65a82712b818d4daca973f90aa69fb23'
                   '4b2cd73871e7d56a37d3c7be72401beb4c76ab890255675d7a38f6d68d269c9d')
sha256sums_aarch64=('0e2b7d7c6d1acc6323de7d363334c92a8a175b8866e0d761bbff7908231b31e9'
                    '3d528dfd38b46a39f601cbd7eaeb4dd137f4d9618f30ceace640c483a7e6af58')

package() {
  install -Dm755 "${srcdir}/vega" "${pkgdir}/usr/bin/vega"
  install -Dm755 "${srcdir}/visor" "${pkgdir}/usr/bin/vegavisor"
}
