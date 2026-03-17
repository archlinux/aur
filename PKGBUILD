# Maintainer: Hexa-Programmer
pkgname=hexatyping-git
_pkgname=hexatyping
pkgver=1.1.5
pkgrel=1
pkgdesc="A minimalist, terminal-based typing tester (TUI) with specialized programming and symbol modes."
arch=('any')
url="https://github.com/Hexa-Programmer/hexatyping" # Make sure this is your actual GitHub URL!
license=('MIT')
depends=('python')
makedepends=('git')
provides=('hexatyping')
conflicts=('hexatyping')

source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

package() {
    cd "$srcdir/$_pkgname"


    install -Dm755 hexatyping.py "$pkgdir/usr/share/hexatyping/hexatyping.py"
    
    cp -r content "$pkgdir/usr/share/hexatyping/"
    mkdir -p "$pkgdir/usr/bin"
    echo "#!/bin/sh" > "$pkgdir/usr/bin/hexatyping"
    echo "python3 /usr/share/hexatyping/hexatyping.py \"\$@\"" >> "$pkgdir/usr/bin/hexatyping"
    chmod 755 "$pkgdir/usr/bin/hexatyping"
}
echo "# Force Update 💀" >> PKGBUILD
# Force Update 💀
