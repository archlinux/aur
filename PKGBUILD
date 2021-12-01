# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>
_pkgname=pixel-saver
pkgname=gnome-shell-extension-$_pkgname
pkgver=1.26
pkgrel=1
pkgdesc="Saves pixels by fusing activity bar and title bar in a natural way"
arch=('any')
url="https://github.com/pixel-saver/pixel-saver"
license=('MIT')
depends=('gnome-shell<1:42' 'xorg-xprop' 'xorg-xwininfo')
install=$_pkgname.install
source=($_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('edc53745d81bc6a2481ea78d9586deaab2e7d20616420177a76aae76ddb1e5b8')

package() {
  cd "$srcdir"/pixel-saver-$pkgver

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -d "$pkgdir"/usr/share/gnome-shell/extensions
  cp -af pixel-saver@deadalnix.me "$pkgdir"/usr/share/gnome-shell/extensions/
}
