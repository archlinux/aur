# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>
_pkgname=pixel-saver
pkgname=gnome-shell-extension-$_pkgname
pkgver=1.32
pkgrel=1
pkgdesc="Saves pixels by fusing activity bar and title bar in a natural way"
arch=('any')
url="https://github.com/pixel-saver/pixel-saver"
license=('MIT')
depends=('gnome-shell' 'xorg-xprop' 'xorg-xwininfo')
install=$_pkgname.install
source=($_pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=('562a1d566bd6ab3ee4e194ed8c48b432865807b9e14d9cad983b5d8d57a279b4')

package() {
  cd "$srcdir"/pixel-saver-$pkgver

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -d "$pkgdir"/usr/share/gnome-shell/extensions
  cp -af pixel-saver@deadalnix.me "$pkgdir"/usr/share/gnome-shell/extensions/
}
