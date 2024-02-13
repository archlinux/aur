# Maintainers:
# - Matthias Gabriel <gabm+aur@mailbox.org>
# - Collide <three-dim-sky@foxmail.com>
#
# https://github.com/TD-Sky/PKGBUILDs

pkgname=satty-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="A screenshot annotation tool inspired by Swappy and Flameshot"
url="https://github.com/gabm/Satty"
license=("MPL-2.0")
arch=("x86_64")
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('gtk4' 'libadwaita')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('1b823ba892d73af5c67058fe776efb1ef0e23e986412b54176d0cc3484d61c56')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "$pkgdir/usr/bin"
  install -Dm 644 "completions/_${pkgname%-bin}" -t "$pkgdir/usr/share/zsh/site-functions"
  install -Dm 644 "completions/${pkgname%-bin}.bash" "$pkgdir/usr/share/bash-completion/completions/${pkgname%-bin}"
  install -Dm 644 "completions/${pkgname%-bin}.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
  install -Dm 644 "completions/${pkgname%-bin}.nu" -t "$pkgdir/usr/share/nushell/completions"
  install -Dm 644 "completions/${pkgname%-bin}.elv" -t "$pkgdir/usr/share/elvish/lib"
  install -Dm 644 "${pkgname%-bin}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm 644 "assets/${pkgname%-bin}.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-bin}"
  install -Dm 644 "assets/${pkgname%-bin}.svg" -t "$pkgdir/usr/share/doc/${pkgname%-bin}/assets"
  install -Dm 644 assets/usage.gif -t "$pkgdir/usr/share/doc/${pkgname%-bin}/assets"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-bin}"
}
