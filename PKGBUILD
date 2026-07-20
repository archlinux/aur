pkgname=pkgpick
pkgver=3.0.0
pkgrel=1
pkgdesc="Interactive fzf-based TUI package manager for pacman/AUR/Flatpak/npm/pip/cargo/go/pipx, with a Settings and Cleanup menu, EN/RU UI"
arch=('any')
url="https://github.com/ItzDast/pkgpick"
license=('GPL-3.0-or-later')
depends=('bash' 'fzf' 'pacman')
optdepends=(
    'yay: AUR search/install/update support'
    'paru: alternative AUR helper (used if yay is absent)'
    'flatpak: manage Flatpak apps and runtimes'
    'npm: manage global npm packages'
    'python-pip: manage pip packages'
    'cargo: manage cargo-installed binaries'
    'go: manage go-installed binaries'
    'python-pipx: manage pipx-installed packages'
)
makedepends=('git')
source=("$pkgname-$pkgver::git+https://github.com/ItzDast/pkgpick.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/pkgpick.sh" "$pkgdir/usr/bin/pkgpick"
}
