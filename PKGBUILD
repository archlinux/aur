# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=yaabsa-bin
pkgver=1.15.0
pkgrel=1
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

sha256sums_x86_64=('93ab3f6e9704ad9cafe692d38e6ffce25e4bcaffdd19d87510092b6a0fda2b2a')
sha256sums_aarch64=('c9b4664748eaa6833557be2657b152b943437faea9454c51af6c3a3703ce822f')
