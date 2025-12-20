# Maintainer: Anjishnu Sengupta <anjishnusengupta947@gmail.com>
pkgname=ny-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="A beautiful terminal-based anime streaming client powered by nyanime.tech"
arch=('any')
url="https://github.com/AnjishnuSengupta/ny-cli"
license=('MIT')
depends=('curl' 'grep' 'sed')
optdepends=(
    'mpv: recommended video player'
    'vlc: alternative video player'
    'fzf: fuzzy finder for better menus'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/AnjishnuSengupta/ny-cli/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # Install the main script
    install -Dm755 ny-cli "$pkgdir/usr/bin/ny-cli"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install README
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
