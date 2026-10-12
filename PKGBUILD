# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=yaabsa-bin
pkgver=1.14.1
pkgrel=3
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

sha256sums_x86_64=('c4a8e36f50d7a263b7782a4f889e3e8f89aa1b8f2e2c50ba1319c3f690c72e11')
sha256sums_aarch64=('43fa167afeb05d962d4746bbe60bcedbc52088dbe1ba488d763d8f455717119b')
