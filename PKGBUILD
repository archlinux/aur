# Maintainer: Jonathan Kirszling <jkirsz@gmail.com>
# Info: https://github.com/johnramsden/zectl/issues/16
pkgname=zectl-pacman-hook
pkgrel=1
pkgver=0.1.1
pkgdesc="Automate boot environment creation and rotation before pacman upgrade"
arch=('any')
url="https://github.com/eoli3n/$pkgname"
license=('UNLICENSE')
depends=('zectl')
install="INSTALL"
source=("10-zectl-pre.hook"
		"zectl-prune"
		"UNLICENSE")
sha256sums=("cc2d2f335bb2b636ed7b873be5f5fb8456f0cbfc877cd4b05f8b08dd7b4f9f53"
"b38b0b2fca33ce64d5c1e713feb3bd7d3a0e85fa8d5c4c5220edefc2a63440da"
"d3c4f1607c9488b22732511b83e6f6173d82499c0678c899666ca12c36517f72")

package() {
	install -Dm644 '10-zectl-pre.hook' "${pkgdir}/usr/share/libalpm/hooks/10-zectl-pre.hook"
	install -Dm755 'zectl-prune' "${pkgdir}/usr/share/libalpm/scripts/zectl-prune"
	install -Dm644 'UNLICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}
