# Maintainer: Nilesh Kevlani <njkevlani@gmail.com>
pkgname=tolaria-bin
pkgver=2026.5.21
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

source=("https://github.com/refactoringhq/tolaria/releases/download/v2026-05-21/Tolaria_2026.5.21_amd64.deb")
sha256sums=('9b38bb119c2bd32ce4111c38bf794baa35cd2262cfc8affeb07dbd1bc8075f95')

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"

	# Remove Debian specific files or empty directories
	rm -rf "${pkgdir}/usr/share/doc"
	rm -rf "${pkgdir}/usr/share/lintian"
}
