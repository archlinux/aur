# Maintainer: xifan <xifan2333@gmail.com>
pkgname=fcitx5-vinput-bin
_pkgname=fcitx5-vinput
pkgver=2.1.6
pkgrel=1
pkgdesc="Offline voice input addon for Fcitx5 with optional OpenAI-compatible postprocess"
arch=('x86_64')
url="https://github.com/xifan2333/fcitx5-vinput"
license=('GPL-3.0-only')
depends=('curl' 'fcitx5' 'libarchive' 'openssl' 'pipewire' 'qt6-base' 'systemd-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
install="${pkgname}.install"
source_x86_64=("${_pkgname}-${pkgver}-1-x86_64.pkg.tar.zst::https://github.com/xifan2333/fcitx5-vinput/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('9c3c7c64c4da72269027414253bb7ac3437d9d95450e35a164fd9c35a0b262cf')

package() {
	cd "${srcdir}"

	# Extract the pre-built Arch package (skip metadata files)
	tar -xf "${_pkgname}-${pkgver}-1-x86_64.pkg.tar.zst" \
		--exclude='.BUILDINFO' \
		--exclude='.MTREE' \
		--exclude='.PKGINFO' \
		-C "${pkgdir}/"
}
