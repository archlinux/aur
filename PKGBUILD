# Maintainer: Hexa Programmer <your-email-here>
pkgname=hexatyping-git
_pkgname=hexatyping
pkgver=1.0.0
pkgrel=1
pkgdesc="A minimalist, terminal-based typing tester (TUI) with 5 technical modes."
arch=('any')
url="https://github.com/Hexa-Programmer/hexatyping"
license=('MIT')
depends=('python')
makedepends=('git')
provides=('hexatyping')
conflicts=('hexatyping')
# This pulls your code directly from your GitHub repo
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

package() {
    cd "$srcdir/hexatyping"
    install -Dm755 hexatyping.py "$pkgdir/usr/share/hexatyping/hexatyping.py"
    
    # This line copies the entire folder!
    cp -r content "$pkgdir/usr/share/hexatyping/"
    
    # Create the symlink
    mkdir -p "$pkgdir/usr/bin"
    ln -s /usr/share/hexatyping/hexatyping.py "$pkgdir/usr/bin/hexatyping"
}
