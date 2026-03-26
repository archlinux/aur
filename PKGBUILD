# Maintainer: Ernesto Cruz Olivera <ecruzolivera@gmail.com>

pkgname=riskie-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Disk automounting daemon for Linux with system tray support (pre-built binary)"
arch=('x86_64')
url="https://github.com/ecruzolivera/riskie"
license=('MIT')
depends=('udisks2' 'gtk3' 'gettext')
provides=('riskie')
conflicts=('riskie')
install=riskie.install
source=("https://github.com/ecruzolivera/riskie/releases/download/v$pkgver/riskie-$pkgver-linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
  cd "riskie-$pkgver"

  install -Dm755 riskie "$pkgdir/usr/bin/riskie"

  install -Dm644 systemd/riskie.service "$pkgdir/usr/lib/systemd/user/riskie.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/riskie/LICENSE"

  for mo_file in locale/*/LC_MESSAGES/riskie.mo; do
    install -Dm644 "$mo_file" "$pkgdir/usr/share/$mo_file"
  done

}
