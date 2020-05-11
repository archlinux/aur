# Maintainer: Jonathan Kirszling <jkirsz@gmail.com>
# Info: https://github.com/johnramsden/zectl/issues/16
pkgname=zectl-pacman-hook
pkgrel=1
pkgver=0.1.0
pkgdesc="Create and prune zectl boot environments before any pacman command"
arch=('any')
url="https://github.com/eoli3n/$pkgname"
license=('UNLICENSE')
depends=('zectl')
install="INSTALL"
source=("10-zectl-pre.hook"
		"zectl-prune"
		"UNLICENSE")
sha256sums=("de9a144e6cda1911395b6491f2e83af0089a72e9eab92199d489b29919d76c2f"
"b38b0b2fca33ce64d5c1e713feb3bd7d3a0e85fa8d5c4c5220edefc2a63440da"
"d3c4f1607c9488b22732511b83e6f6173d82499c0678c899666ca12c36517f72")

package() {
	install -Dm644 '10-zectl-pre.hook' "${pkgdir}/usr/share/libalpm/hooks/10-zectl-pre.hook"
	install -Dm755 'zectl-prune' "${pkgdir}/usr/share/libalpm/scripts/zectl-prune"
	install -Dm644 'UNLICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}
