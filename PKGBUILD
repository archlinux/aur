# Maintainer: Nilesh Kevlani <njkevlani@gmail.com>
pkgname=tolaria-bin
pkgver=2027.7.31
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

source=("https://github.com/refactoringhq/tolaria/releases/download/v2027-07-31/Tolaria_2027.7.31_amd64.deb")
sha256sums=('9a76e92de5173cb701e17c4147dc97665112ba85fd579ec0d808698688b841da')

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"

	# Remove Debian specific files or empty directories
	rm -rf "${pkgdir}/usr/share/doc"
	rm -rf "${pkgdir}/usr/share/lintian"
}
