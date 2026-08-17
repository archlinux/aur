# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=wl-freeze
pkgver=2.1.0
pkgrel=1
pkgdesc='A community-driven utility to suspend a game process (and other programs) in Wayland compositors'
url='https://github.com/Zerodya/wl-freeze'
license=('GPL3')
arch=('any')
depends=('bash')
source=("https://github.com/Zerodya/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('07db4d7c789ad911aa88c684547f276c4aa554adc5b11c01c4c7fe3a813605ba8a636b2a01ebd30b1910327b6985d13ae9adc8437f937e109c0a6326d8992628')

package() {
  # main script
  cd $pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

  # completions
  cd completions
  install -Dm644 bash/wl-freeze "$pkgdir/usr/share/bash-completion/completions/wl-freeze"
  install -Dm644 fish/wl-freeze.fish "$pkgdir/usr/share/fish/vendor_completions.d/wl-freeze.fish"
  install -Dm644 zsh/_wl-freeze "$pkgdir/usr/share/zsh/site-functions/_wl-freeze"
}
