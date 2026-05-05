# Maintainer: Nilesh Kevlani <njkevlani@gmail.com>
pkgname=tolaria-bin
pkgver=2026.5.4
pkgrel=2
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

source=("https://github.com/refactoringhq/tolaria/releases/download/v2026-05-04/Tolaria_2026.5.4_amd64.deb")
sha256sums=('6306f93feb8b165ba47d0e008b6ae4e95f2aee332d3d772ace9abb40d4c9bf50')

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"

	# Remove Debian specific files or empty directories
	rm -rf "${pkgdir}/usr/share/doc"
	rm -rf "${pkgdir}/usr/share/lintian"
}
