# Maintainer: Nilesh Kevlani <njkevlani@gmail.com>
pkgname=tolaria-bin
pkgver=2026.6.23
pkgrel=1
pkgdesc="Personal knowledge and life management app"
arch=('x86_64')
url="https://github.com/refactoringhq/tolaria"
license=('AGPL-3.0-or-later')
depends=(
	'webkit2gtk-4.1'
)
optdepends=()
options=('!emptydirs' '!strip')
makedepends=('libarchive') # For bsdtar

source=("https://github.com/refactoringhq/tolaria/releases/download/v2026-06-23/Tolaria_2026.6.23_amd64.deb")
sha256sums=('e69c2f1befe864484fadf6559aebb0461bba7be3ef6f71323100dae22bf94a3e')

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"

	# Remove Debian specific files or empty directories
	rm -rf "${pkgdir}/usr/share/doc"
	rm -rf "${pkgdir}/usr/share/lintian"
}
