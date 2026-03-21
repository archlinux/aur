# Maintainer: xifan <xifan2333@gmail.com>
pkgname=fcitx5-vinput-bin
_pkgname=fcitx5-vinput
pkgver=1.1.11
pkgrel=1
pkgdesc="Offline voice input addon for Fcitx5 with optional OpenAI-compatible postprocess"
arch=('x86_64')
url="https://github.com/xifan2333/fcitx5-vinput"
license=('GPL-3.0-only')
depends=('curl' 'fcitx5' 'pipewire' 'systemd-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
install="${pkgname}.install"
source_x86_64=("${_pkgname}-${pkgver}-1-archlinux-x86_64.pkg.tar.zst::https://github.com/xifan2333/fcitx5-vinput/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1-archlinux-x86_64.pkg.tar.zst")
sha256sums_x86_64=('4c502cd0cd2f51fe3914839abfda326a1973326d45226898715676abf6597d5a')

package() {
	cd "${srcdir}"

	# Extract the pre-built Arch package (skip metadata files)
	tar -xf "${_pkgname}-${pkgver}-1-archlinux-x86_64.pkg.tar.zst" \
		--exclude='.BUILDINFO' \
		--exclude='.MTREE' \
		--exclude='.PKGINFO' \
		-C "${pkgdir}/"
}
