# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=wl-freeze
pkgver=2.2.0
pkgrel=1
pkgdesc='A community-driven utility to suspend a game process (and other programs) in Wayland compositors'
url='https://github.com/Zerodya/wl-freeze'
license=('GPL3')
arch=('any')
depends=('bash')
source=("https://github.com/Zerodya/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('0bbc08dcb5c3322fa7c3706e8e4dcabdb32580719f76d7dd825f88a955488bd8dc720dce55570f6449dfafda346e1ee62e2e02d5829a5e21ac890f517ade45ac')

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
