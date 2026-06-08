# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=wl-freeze
pkgver=2.0.2
pkgrel=1
pkgdesc='A community-driven utility to suspend a game process (and other programs) in Wayland compositors'
url='https://github.com/Zerodya/wl-freeze'
license=('GPL3')
arch=('any')
depends=('bash')
source=("https://github.com/Zerodya/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8adcaaac5873b7a90cf3a9fc925149bec3519396fbde6a2a36d73c162021ee57257aaa546acf70cd70c0df30655044a21558c1bd74d5dcfd935c62b50f7b3a30')

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
