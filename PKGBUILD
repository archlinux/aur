# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>

pkgname=yaabsa-bin
pkgver=1.11.0
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
	'libayatana-appindicator'
	'hicolor-icon-theme'
)
makedepends=('tar')

source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/linux-deb-x86_64-yaabsa_v${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/linux-deb-aarch64-yaabsa_v${pkgver}_arm64.deb")

package() {
  install -dm755 "${pkgdir}/usr/bin/"
  tar -xvf "${srcdir}"/data.tar.zst -C "${pkgdir}"
  ln -s "${pkgdir}/usr/share/${pkgname%-bin}/yaabsa" "${pkgdir}/usr/bin/yaabsa"
}

sha256sums_x86_64=('9259c7544ddca027a01b0a2c8926dcf346039621df31a89e89c3f3d602f2a02b')
sha256sums_aarch64=('e15509429bbce7e3f99cb4c7e8898b8ee6aa858b069ca7227542ce6bd45818ef')
