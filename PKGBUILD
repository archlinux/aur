pkgname=pac-pacman-aliases
pkgver=1.9.9
pkgrel=1
pkgdesc="Add pac with apt-like pacman aliases, completions, and globbing search pattern support"
arch=('any')
url="https://github.com/bbedward/pac-pacman-aliases"
license=('MIT')
source=("https://github.com/bbedward/pac-pacman-aliases/releases/download/v$pkgver/source_code_v$pkgver.zip")
sha256sums=('SKIP')
conflicts=('pac-wrapper')

package() {
  # Use pkgver in the directory name
  install -Dm755 "$srcdir/src/pac" "$pkgdir/usr/local/bin/pac"
  install -Dm644 "$srcdir/src/completions.bash" "$pkgdir/usr/share/bash-completion/completions/pac"
  install -Dm644 "$srcdir/src/completions.zsh" "$pkgdir/usr/share/zsh/site-functions/_pac_pacman_completions"
  install -Dm644 "$srcdir/src/completions.fish" "$pkgdir/usr/share/fish/completions/pac.fish"
}
