# Maintainer: xifan <xifan2333@gmail.com>
pkgname=fcitx5-vinput-bin
_pkgname=fcitx5-vinput
pkgver=2.0.6
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
source_x86_64=("${_pkgname}-${pkgver}-1-x86_64.pkg.tar.zst::https://github.com/xifan2333/fcitx5-vinput/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('40e6dd60ac8847a7451fb02971721e79822b6dc97a306fd7b2e627c34250a02d')

package() {
	cd "${srcdir}"

	# Extract the pre-built Arch package (skip metadata files)
	tar -xf "${_pkgname}-${pkgver}-1-x86_64.pkg.tar.zst" \
		--exclude='.BUILDINFO' \
		--exclude='.MTREE' \
		--exclude='.PKGINFO' \
		-C "${pkgdir}/"
}
