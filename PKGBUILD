# Maintainer: SaintFore <saintfore@example.com>
pkgname=leetcode-fsrs-cli-bin
pkgver=1.5.7
pkgrel=1
pkgdesc="A CLI tool for LeetCode practice using FSRS spaced repetition algorithm (Binary Version)"
arch=('x86_64')
url="https://github.com/SaintFore/LeetCodeCLI"
license=('MIT')
depends=('glibc')
provides=('leetcode-fsrs-cli')
conflicts=('leetcode-fsrs-cli')
replaces=('leetcode-fsrs-cli')

source=("${pkgname}-${pkgver}::https://github.com/SaintFore/LeetCodeCLI/releases/download/v$pkgver/leetcode-fsrs-linux-x86_64"
        "https://raw.githubusercontent.com/SaintFore/LeetCodeCLI/v$pkgver/LICENSE"
        "https://raw.githubusercontent.com/SaintFore/LeetCodeCLI/v$pkgver/README.md")
sha256sums=('867a94a1555f1d79afeffec3de67349f8f4733e5db8d669212005df777d358ec'
            'eeb2575ca0495a0245f39f79c24f984f1c154c48b5910688ab2cbd761e68fe86'
            '905a265642794bb7689717609c871ec8e80ac52443d033c696ecf92c83a01d86')

package() {
  # Install binary
  install -Dm755 leetcode-fsrs-linux-x86_64 "$pkgdir/usr/bin/leetcode-fsrs"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
