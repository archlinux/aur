# Maintainer: notgeocube@outlook.com
pkgname=chainz
pkgver=1.3
pkgrel=1
pkgdesc="Chainz executable from GitHub (git version)"
arch=('x86_64')
url="https://github.com/gdplayerokay/Chainz-package"
license=('MIT')
depends=('git' 'bash' 'pacman' 'yay' 'fzf')  # Add any runtime dependencies
source=("git+https://github.com/gdplayerokay/Chainz-package.git")
sha256sums=('SKIP')  # Skipped for git sources

# Automatically update pkgver based on number of commits
pkgver() {
    cd "$srcdir/Chainz-package"
    echo "0.1.$(git rev-list --count HEAD)"
}

package() {
    cd "$srcdir/Chainz-package"
    install -Dm755 chainz "$pkgdir/usr/bin/chainz"
}
