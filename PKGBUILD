# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=vega-protocol-bin
pkgver=0.75.8
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

sha256sums_x86_64=('56b57f2bc69a82d4330fc7e83810136e53ee9a386c4085b58166c99364dce325'
                   '6305aee709fdc59d69d796d655da8457cd92293207761357f432007753f02250')
sha256sums_aarch64=('4e002206f6109ec4f362cb8da779fcbdd0efba12fa37157b231e444046222079'
                    '675d31dfe82ae8238bfb5f7bc70f0307ea89bd6bc568267bfa6121aa105fda44')
b2sums_x86_64=('114e9c95ce445c0fed992d0a1a4540c377f350860ad4a71bb999dddd0dc0ec2a40ae40096faed0b41c76fc2d955d6572a4d2f224e3eafbaf1525692753241af1'
               'f300d6e7e7e28ee140d361aed8c8c8398c25f0f0ccffa15720cff749390a3009218fc05c42b8a81259035174f8f7f212bb4aaf9e8f3d6480f3630af516c90d85')
b2sums_aarch64=('59184d793ab8463ca77c661062fedc0e45d39ed458af5d1565de5ba0adf1dd31a8b7e895b0364017c0836d71a279edf91110d5fdb9fe3554edfbbec4f8be6d44'
                '33db8c12ebdfb2d7854ae4417c6f0e1d0d349ba57a50488ed958be6cbb2839dd9b05155816cc0c5e880372dbb441e62c6730b17589530035c4bdf6e0139b65bd')

package() {
  install -Dm755 "${srcdir}/vega" "${pkgdir}/usr/bin/vega"
  install -Dm755 "${srcdir}/visor" "${pkgdir}/usr/bin/vegavisor"
}
