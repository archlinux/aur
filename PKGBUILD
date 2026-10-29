# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=yaabsa-bin
pkgver=1.16.0
pkgrel=2
pkgdesc="Unofficial feature rich, responsive, modern client for Audiobookshelf"
arch=('x86_64' 'aarch64')
url="https://github.com/Vito0912/yaabsa"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('strip' '!libtool' '!staticlibs' '!emptydirs')

depends=(
	'libmpv.so'
	'libsecret'
	'gtk3'
	'libayatana-indicator'
	'libayatana-appindicator'
	'hicolor-icon-theme'
)
install=yaabsa.install

source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/linux-deb-x86_64-yaabsa_v${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/linux-deb-aarch64-yaabsa_v${pkgver}_arm64.deb")

package() {
  bsdtar -xvf "${srcdir}"/data.tar.zst -C "${pkgdir}"
  install -dm755 "${pkgdir}/usr/bin/"
}

sha256sums_x86_64=('aeb4f347b8948a130776b743df133bd1bee77c5ceae0dfbfa7efbf06914da43a')
sha256sums_aarch64=('be2c065da75678ea27d508b211b39f6a83b00cda8254e84d1c804b48fd5cce93')
