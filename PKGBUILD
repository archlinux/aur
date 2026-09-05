# Maintainer: xifan <xifan2333@gmail.com>
pkgname=fcitx5-vinput-lite-bin
_pkgname=fcitx5-vinput-lite
pkgver=2.3.15
pkgrel=1
pkgdesc="Voice input addon for Fcitx5, built without local ASR (binary release)"
arch=('x86_64')
url="https://github.com/xifan2333/fcitx5-vinput"
license=('GPL-3.0-only')
depends=('curl' 'fcitx5' 'libarchive' 'openssl' 'pipewire' 'qt6-base' 'systemd-libs')
provides=('fcitx5-vinput' 'fcitx5-vinput-bin')
conflicts=('fcitx5-vinput' 'fcitx5-vinput-bin')
options=(!strip)
install="${pkgname}.install"
source_x86_64=("${_pkgname}-${pkgver}-1-x86_64.pkg.tar.zst::https://github.com/xifan2333/fcitx5-vinput/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums_x86_64=('c52b6c4914c69c84ed5ffbd33f19b5318a8a37bd335789e1403fa04a8f7cbcbd')

package() {
	cd "${srcdir}"

	# Extract the pre-built Arch package (skip metadata files)
	tar -xf "${_pkgname}-${pkgver}-1-x86_64.pkg.tar.zst" \
		--exclude='.BUILDINFO' \
		--exclude='.MTREE' \
		--exclude='.PKGINFO' \
		-C "${pkgdir}/"
}
