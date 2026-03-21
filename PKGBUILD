# Maintainer: Digvijay Mahapatra <mahapatra.digvijay at gmail dot com>

pkgname=innu-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='A beautiful, minimal, and fast Wi-Fi manager for Linux built with Rust and egui.'
arch=('x86_64' 'aarch64')
url='https://github.com/gitfudge0/innu'
license=('MIT')
depends=('networkmanager')
provides=('innu')
conflicts=('innu' 'innu-git')
options=('!debug')

source_x86_64=(
  "innu-v${pkgver}-linux-x64.tar.gz::https://github.com/gitfudge0/innu/releases/download/v${pkgver}/innu-v${pkgver}-linux-x64.tar.gz"
  'innu.desktop'
)
source_aarch64=(
  "innu-v${pkgver}-linux-arm64.tar.gz::https://github.com/gitfudge0/innu/releases/download/v${pkgver}/innu-v${pkgver}-linux-arm64.tar.gz"
  'innu.desktop'
)

sha256sums_x86_64=('06dcb1147affc586f708a49e9eab3d1b1f32b208c27966cf3622df1d6ce04bf7'
  '03e59187e530f73298f6636a38ee4d8731cac003118c511a445d715e9130eb94')
sha256sums_aarch64=('6c6dd7483126d571491fadd5032062daf9c2220cab1bf7d6d8b69b0357b798df'
  '03e59187e530f73298f6636a38ee4d8731cac003118c511a445d715e9130eb94')

package() {
  install -Dm755 "${srcdir}/innu" "${pkgdir}/usr/bin/innu"
  install -Dm644 "${srcdir}/innu.desktop" "${pkgdir}/usr/share/applications/innu.desktop"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
