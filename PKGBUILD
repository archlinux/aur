# Maintainer: Andrew <itspixelatd@proton.me>
pkgname=arch-scripts
pkgver=0.2.0
pkgrel=1
pkgdesc="A useful CLI tool to do stuff in Arch Linux."
arch=('any')
url="https://github.com/username/arch-scripts"
license=('GPL3')
depends=('python' 'systemd' 'pacman')
optdepends=('yay: for AUR updates' 'paru: for AUR updates')
source=('main.py'
        'config.py'
        'update.py')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
    # No build step required for Python-only project
    true
}

package() {
    cd "$srcdir"

    # Create directories
    install -Dm755 main.py "$pkgdir/usr/bin/arch-scripts"
    install -Dm644 config.py "$pkgdir/usr/lib/python3/site-packages/arch_scripts/config.py"
    install -Dm644 update.py "$pkgdir/usr/lib/python3/site-packages/arch_scripts/update.py"
}
