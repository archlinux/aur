# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>

pkgname=yaabsa-bin
pkgver=1.12.0
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
	'libayatana-appindicator'
	'hicolor-icon-theme'
)

source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/linux-deb-x86_64-yaabsa_v${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/linux-deb-aarch64-yaabsa_v${pkgver}_arm64.deb")

package() {
  bsdtar -xvf "${srcdir}"/data.tar.zst -C "${pkgdir}"
  install -dm755 "${pkgdir}/usr/bin/"
  ln -s "${pkgdir}/usr/share/yaabsa/yaabsa" "${pkgdir}/usr/bin/yaabsa"
}

sha256sums_x86_64=('6ce2f04906fc1ce94c75af0b7f813a6bab8ce3c93a986306dfec3fc94e5bf908')
sha256sums_aarch64=('8e1ed32505a8525b719357f7b53b011e4682fcc5c60370ffd8817b1b56ee45ff')
