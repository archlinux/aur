# Maintainer: Nilesh Kevlani <njkevlani@gmail.com>
pkgname=tolaria-bin
pkgver=2026.4.25
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
makedepends=('tar')

source=("https://github.com/refactoringhq/tolaria/releases/download/stable-v${pkgver}/Tolaria_${pkgver}_amd64.deb")
sha256sums=('aaca493e48f944999574389f234e84b5f148246c81e2f2edb09a3bb8ae64e09e')

package() {
	bsdtar -xf data.tar.gz -C "$pkgdir/"

	# Remove Debian specific files or empty directories
	rm -rf "${pkgdir}/usr/share/doc"
	rm -rf "${pkgdir}/usr/share/lintian"
}
