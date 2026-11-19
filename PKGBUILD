# Maintainer: Matteo Nista <m.nista@hotmail.it>
pkgname=gtk4-polkit-agent-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Minimal GTK4 polkit authentication agent for Wayland (prebuilt)"
arch=('x86_64')
url="https://gitlab.com/nisby/gtk4-polkit-agent"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'polkit')
provides=('gtk4-polkit-agent')
conflicts=('gtk4-polkit-agent')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/-/releases/v$pkgver/downloads/gtk4-polkit-agent-v$pkgver-x86_64.tar.gz")
sha256sums=('d6da98ce8329348a30e08483d7dd7a52c9d4d9b9711f4537d638175f65ff466b')

package() {
  install -Dm755 "$srcdir/gtk4-polkit-agent" "$pkgdir/usr/bin/gtk4-polkit-agent"
  install -Dm644 "$srcdir/gtk4-polkit-agent.service" "$pkgdir/usr/lib/systemd/user/gtk4-polkit-agent.service"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
