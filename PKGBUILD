#!/bin/bash
pkgname='runit-completion'
pkgver=20200826
pkgrel=2
pkgdesc="Bash completion for Runit"
arch=('any')
license=('BSD')
makedepends=(sed)
depends=(bash-completion)
optdepends=( 'runit: like the entire reason for using this package')
source=('sv::https://raw.githubusercontent.com/void-linux/runit/master/completions/sv.bash')
md5sums=('95ff0204b1a4f14f5a777018898b6135')

package() {
	# Artix port
	sed -i 's|/var/|/run/runit/|g' sv
	install -Dm644 sv "$pkgdir"/usr/share/bash-completion/completions/sv
}
