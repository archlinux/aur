# Maintainer: karbonedev <muhammed.oktay18100@gmail.com>
pkgname=anisama-cli
pkgver=1.3.0
pkgrel=1
pkgdesc="Anime streaming CLI with real episode numbers and special episodes support for anime-sama.fr"
arch=('any')
url="https://github.com/karbonedev/anisama-cli"
license=('MIT')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'fzf' 'mpv')
makedepends=('git')
source=("${pkgname}::git+https://github.com/karbonedev/${pkgname}.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    
    # Install main script
    install -Dm755 anisama-cli "$pkgdir/usr/bin/anisama-cli"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install license if available
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}