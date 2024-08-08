# Maintainer: Emil Bay <archlinux@tixz.dk>
pkgname=vega-protocol-bin
pkgver=0.77.6
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

sha256sums_x86_64=('2aaccbf3cdbecfb5be045c5f86cb5341fd5dfdebd9b648dff8acfcee4329c6a9'
                   'fe192ed275763d616f7a7e650b06058d008e29514ca97df045000d956386abca')
sha256sums_aarch64=('35837c09e724ae9b71133c547233d3c2bf0e8d02b5a425ac37a0818e377eb517'
                    '9a41be35a323f621b6fad9277362bd2accbd9d28651dc133c9dc3952631be139')
b2sums_x86_64=('63128a7bca4693ce62988475f5859a328bfeacd9cddddefb56f6e451dd09b9352c32be448376b031194dfa449146b2b4479f64e24fc07ac9a0f83eaf0f1e04cc'
               '6d34ada3f8d97ff5c489b644bf53be244e0cbc9cc817be899db1de601a2f6c9090657aead0e186d3d39b2613a8143b6864dec6b5fdd7c25628b9cba4026cfaf9')
b2sums_aarch64=('2073356b1aae8a0f8d0206b8189ae80463c38f2e463a90ef4f00273e2ff91f0a28bc3a1c256cd72c1cd734918122db17d3ef3d3a40f59f0e42df42eca22e465a'
                '4a70448f549d3e9cb2e33d614df20201613dd141c3a0b810fa6c3b0460369a3298af48fd9b073aaf11bd12ff6e5c35fd0702fce7637ee9fd98a4560982742647')

package() {
  install -Dm755 "${srcdir}/vega" "${pkgdir}/usr/bin/vega"
  install -Dm755 "${srcdir}/visor" "${pkgdir}/usr/bin/vegavisor"
}
