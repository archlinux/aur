# Maintainer: steffeno <steffeno dash etc at protonmail dot com>

pkgname=ghidra2dwarf
pkgver=1.0
pkgrel=1
pkgdesc='Ghidra plugin to export information from ghidra to dwarf sections inside ELF binaries'
arch=('any')
url='https://github.com/cesena/ghidra2dwarf'
license=('MIT')
depends=('python' 'ghidra')
makedepends=()
source=("$pkgname.zip::$url/releases/download/latest/ghidra2dwarf.zip")
sha512sums=('71c4c3d47dde92b66d4990f59ec975d32368e6eb673a97c1827645858d6f7c12045d72b26871b31db9efe8277f07ceab227596d028d75e8a8ab6e155dc5d8af3')

package() {
    cd "$srcdir/$pkgname"
    [ -z $GHIDRA_HOME ] && GHIDRA_HOME="/opt/ghidra/Ghidra/Features/FileFormats/ghidra_scripts"

    install -D -m644 "libdwarf.jar" "$pkgdir/$GHIDRA_HOME/libdwarf.jar"
    install -D -m644 "elf.py" "$pkgdir/$GHIDRA_HOME/elf.py"
    install -D -m644 "ghidra2dwarf.py" "$pkgdir/$GHIDRA_HOME/ghidra2dwarf.py"
}
