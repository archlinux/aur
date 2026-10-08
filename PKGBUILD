# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>

pkgname=yaabsa-bin
pkgver=1.13.0
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

sha256sums_x86_64=('3d27ba4c1d48b41f0223589586fd25447ce5825e4212734381e676557bc9aa5d')
sha256sums_aarch64=('2d69751c0d1c251e27f32fa58dc747d289b44a49b805f3cc8f83e3e712a87412')
