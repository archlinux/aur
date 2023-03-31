# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=ghidra-xtensa-git
pkgver=20230331
pkgrel=2
pkgdesc="Tensilica Xtensa processor module for Ghidra"
arch=('x86_64')
url="https://github.com/yath/ghidra-xtensa"
license=('MIT')
depends=('java-environment>=8' 'ghidra')
makedepends=('git')
source=("git+https://github.com/yath/ghidra-xtensa.git")
sha512sums=('SKIP')

build() {
  cd "ghidra-xtensa"

  GHIDRA_DIR=/opt/ghidra make
}

package() {
  cd "ghidra-xtensa"

  mkdir -p $pkgdir/opt/ghidra/Ghidra/Processors/Xtensa
	cp -r data $pkgdir/opt/ghidra/Ghidra/Processors/Xtensa
  chmod -R o+r $pkgdir/opt/ghidra/Ghidra/Processors/Xtensa
  touch $pkgdir/opt/ghidra/Ghidra/Processors/Xtensa/Module.manifest
}

# vim:set ts=2 sw=2 et:
