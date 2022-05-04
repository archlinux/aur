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
sha512sums=('23e43ce0bbc0ba6667f6647a896b75c951f9031fd050a0512f6b0c498f4ade7295d41377a7559b63d5a9d47a30d4e123b794717b093f42bfb5e6982c3a41895f')

package() {
    cd "$srcdir/$pkgname"
    [ -z $GHIDRA_HOME ] && GHIDRA_HOME='/opt/ghidra/'
    subdir="Ghidra/Extensions/$pkgname/"

    install_dir="$GHIDRA_HOME$subdir"

    install -D -m644 "libdwarf.jar" "$pkgdir/$install_dir/libdwarf.jar"
    install -D -m644 "elf.py" "$pkgdir/$install_dir/elf.py"
    install -D -m644 "ghidra2dwarf.py" "$pkgdir/$install_dir/ghidra2dwarf.py"

    msg "Remember to add the script's directory ($install_dir) by choosing 'Display Script Manager' -> 'Manage Script Directories' -> 'Display file chooser to add bundles to list'"
}
