# Maintainer: SaintFore <saintfore@example.com>
pkgname=leetcode-fsrs-cli-bin
pkgver=1.6.6
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
sha256sums=('a02d31f53bb0137120838199cf0e14e8a3bb6484ccd3891caa3d3d66b5bc02aa'
            'eeb2575ca0495a0245f39f79c24f984f1c154c48b5910688ab2cbd761e68fe86'
            '905a265642794bb7689717609c871ec8e80ac52443d033c696ecf92c83a01d86')

package() {
  # Install binary
  install -Dm755 "${pkgname}-${pkgver}" "$pkgdir/usr/bin/leetcode-fsrs"
  ln -s leetcode-fsrs "$pkgdir/usr/bin/lcf"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
